library(tidyverse)
library(lubridate)
library(janitor)

# 1. Load monthly CSVs
raw_path <- "Data_Raw"
files <- list.files(raw_path, full.names = TRUE, pattern = "\\.csv$")

# 2. Merge
all_trips <- files %>% 
  map_dfr(read_csv, show_col_types = FALSE)

# 3. Standardize column names
all_trips <- clean_names(all_trips)

# 4. Add ride_length + day_of_week
all_trips <- all_trips %>%
  mutate(
    ride_length = as.numeric(ended_at - started_at, units = "secs"),
    day_of_week = wday(started_at, label = TRUE, abbr = FALSE)
  )

# 5. Remove bad data
all_trips <- all_trips %>%
  filter(
    ride_length > 0,
    !is.na(start_station_name),
    !is.na(end_station_name)
  )

# 6. Save final cleaned dataset
write_csv(all_trips, "Data_Clean/all_trips_cleaned.csv")
