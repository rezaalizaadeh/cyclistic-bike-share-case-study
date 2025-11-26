# analysis.R  — Cyclistic case study

# 1. Load packages
library(tidyverse)
library(lubridate)

# 2. Load cleaned data (single merged file)
all_trips <- read_csv("Data_Clean/all_trips_cleaned.csv")

# 3. Quick checks
dim(all_trips)          # how many rows and columns?
head(all_trips)        # first 6 rows
summary(all_trips$ride_length)
table(all_trips$member_casual)
table(all_trips$day_of_week)

# 4. Add additional time columns for analysis
all_trips <- all_trips %>%
  mutate(
    date = as.Date(started_at),
    month = format(started_at, "%m"),
    day = format(started_at, "%d"),
    year = format(started_at, "%Y"),
    ride_length_min = ride_length / 60,
    day_of_week = factor(day_of_week,
                         levels = c("Sunday", "Monday", "Tuesday", "Wednesday",
                                    "Thursday", "Friday", "Saturday"),
                         ordered = TRUE)
  )

# 5. Basic descriptive statistics for ride length
mean_ride <- mean(all_trips$ride_length_min)
median_ride <- median(all_trips$ride_length_min)
max_ride <- max(all_trips$ride_length_min)
min_ride <- min(all_trips$ride_length_min)

mean_ride
median_ride
max_ride
min_ride
# Average ride length by user type
aggregate(all_trips$ride_length_min ~ all_trips$member_casual, FUN = mean)

# Median ride length by user type
aggregate(all_trips$ride_length_min ~ all_trips$member_casual, FUN = median)

# Number of rides by user type
table(all_trips$member_casual)

# 6. Weekday analysis: number of rides and average duration
weekday_summary <- all_trips %>%
  group_by(member_casual, day_of_week) %>%
  summarise(
    number_of_rides   = n(),
    average_duration  = mean(ride_length_min),
    .groups = "drop"
  ) %>%
  arrange(member_casual, day_of_week)

weekday_summary

# 7. Monthly analysis: number of rides and average duration
monthly_summary <- all_trips %>%
  group_by(member_casual, month) %>%
  summarise(
    number_of_rides = n(),
    average_duration = mean(ride_length_min),
    .groups = "drop"
  ) %>%
  arrange(member_casual, month)

monthly_summary
print(weekday_summary, n = Inf)

# 8. Hour of day analysis
all_trips <- all_trips %>%
  mutate(hour = format(started_at, "%H"))

hourly_summary <- all_trips %>%
  group_by(member_casual, hour) %>%
  summarise(
    number_of_rides = n(),
    average_duration = mean(ride_length_min),
    .groups = "drop"
  ) %>%
  arrange(member_casual, hour)
print(monthly_summary, n = Inf)

# 9. Export summary tables for Tableau

# Export weekday summary
write_csv(weekday_summary, "Summaries/weekday_summary.csv")

# Export monthly summary
write_csv(monthly_summary, "Summaries/monthly_summary.csv")

# Export hourly summary
write_csv(hourly_summary, "Summaries/hourly_summary.csv")
# Save dataset WITH the new added columns
write_csv(all_trips, "Data_Clean/all_trips_final.csv")
