# ================================
# visualizations.R – Cyclistic Case Study Plots
# ================================

library(tidyverse)

# 1. Load summary tables
weekday_summary <- read_csv("Summaries/weekday_summary.csv")
monthly_summary <- read_csv("Summaries/monthly_summary.csv")
hourly_summary  <- read_csv("Summaries/hourly_summary.csv")

# ------------------------------------------
# 2. Weekday Plot – Usage by day of week
# ------------------------------------------
p1 <- weekday_summary %>%
  ggplot(aes(x = day_of_week,
             y = number_of_rides,
             fill = member_casual)) +
  geom_col(position = "dodge") +
  labs(title = "Rides by Day of Week (Members vs Casual)",
       x = "Day of Week",
       y = "Number of Rides",
       fill = "User Type") +
  theme_minimal()

p1
ggsave("Visuals/weekday_rides.png", width = 10, height = 6, dpi = 300)

# ------------------------------------------
# 3. Average ride duration by weekday
# ------------------------------------------
p2 <- weekday_summary %>%
  ggplot(aes(x = day_of_week,
             y = average_duration,
             color = member_casual,
             group = member_casual)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  labs(title = "Average Ride Duration by Weekday",
       x = "Day of Week",
       y = "Avg Duration (min)") +
  theme_minimal()

p2
ggsave("Visuals/weekday_duration.png", width = 10, height = 6, dpi = 300)

# ------------------------------------------
# 4. Monthly rides plot
# ------------------------------------------
p3 <- monthly_summary %>%
  ggplot(aes(x = month,
             y = number_of_rides,
             color = member_casual,
             group = member_casual)) +
  geom_line(size = 1.3) +
  geom_point(size = 2) +
  labs(title = "Rides per Month",
       x = "Month",
       y = "Number of Rides",
       color = "User Type") +
  theme_minimal()

p3
ggsave("Visuals/monthly_rides.png", width = 10, height = 6, dpi = 300)

# ------------------------------------------
# 5. Hourly rides plot
# ------------------------------------------
p4 <- hourly_summary %>%
  ggplot(aes(x = hour,
             y = number_of_rides,
             color = member_casual,
             group = member_casual)) +
  geom_line(size = 1.2) +
  geom_point(size = 1.5) +
  labs(title = "Rides by Hour of Day",
       x = "Hour of Day",
       y = "Number of Rides",
       color = "User Type") +
  theme_minimal()

p4
ggsave("Visuals/hourly_rides.png", width = 10, height = 6, dpi = 300)

# =========================================================
# 5. Heatmap: rides by hour and weekday (professional)
# =========================================================

# Build summary table: rides per hour x weekday x user type
heatmap_summary <- all_trips %>%
  mutate(hour = format(started_at, "%H")) %>%
  group_by(member_casual, day_of_week, hour) %>%
  summarise(number_of_rides = n(), .groups = "drop")

# Heatmap plot
p_heatmap <- ggplot(heatmap_summary,
                    aes(x = hour,
                        y = day_of_week,
                        fill = number_of_rides)) +
  geom_tile(color = "white") +
  facet_wrap(~ member_casual, ncol = 1) +
  scale_fill_viridis_c(option = "C", labels = scales::comma) +
  labs(
    title = "Rides by Hour and Weekday",
    subtitle = "Comparison of casual riders vs annual members",
    x = "Hour of Day",
    y = "Day of Week",
    fill = "Number of rides"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    panel.grid = element_blank(),
    strip.text = element_text(face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

# Show plot
p_heatmap
ggsave("Visuals/heatmap_hour_weekday.png",
      plot = p_heatmap,
      width = 10, height = 6, dpi = 300)
