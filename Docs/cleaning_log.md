# Cyclistic – Data Cleaning Log  

This document records how the Divvy/Cyclistic trip data was cleaned and prepared before analysis.

---

## Dataset  

- 12 monthly CSV files of historical Divvy/Cyclistic trip data  
- Time span: **Nov 2024 – Oct 2025**  
- Raw files stored in: `Data_Raw/`  
- Cleaned outputs stored in: `Data_Clean/`  

---

## Tools  

- **R / RStudio** (main tool for cleaning, transformation, and merging)  
- Packages: `tidyverse` (especially `dplyr`, `lubridate`, `readr`) and optionally `data.table` for speed  

---

## Cleaning Steps (planned and executed in R)  

1. **Load monthly CSVs**  
   - Used `list.files()` to list all `*.csv` files in `Data_Raw/`.  
   - Read each file with `read_csv()` and stored them in a list.  

2. **Standardize column names**  
   - Ensured that all datasets share the same column structure:  
     `ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual`.  
   - Renamed any inconsistent columns (e.g., older naming conventions) to the standard names.

3. **Combine all months into one dataframe**  
   - Used `bind_rows()` to merge the 12 dataframes into a single object: `all_trips_raw`.  
   - Verified row counts vs. the sum of individual files.

4. **Convert data types**  
   - Parsed `started_at` and `ended_at` as proper datetime objects using `lubridate::ymd_hms()` or similar.  
   - Ensured `member_casual` and `rideable_type` are factors/characters.  
   - Checked for obvious parsing errors or NAs introduced during conversion.

5. **Create derived fields**  
   - `ride_length`  
     - Calculated as `ended_at - started_at`.  
     - Stored both as a `difftime` object and as numeric minutes/seconds if needed.  
   - `day_of_week`  
     - Calculated from `started_at` (e.g., `wday(started_at, label = TRUE, week_start = 1)`).  

6. **Filter invalid records**  
   Removed rows that would distort analysis:  
   - Trips with **ride_length ≤ 0** (negative or zero duration).  
   - Rows with missing `started_at` or `ended_at`.  
   - (Optional) Trips longer than a reasonable threshold (e.g., > 24 hours) treated as data errors.  

7. **Handle missing locations**  
   - Kept rows with missing station names if timestamps and rider type are valid (still useful for time-based analysis).  
   - Documented the percentage of rows with missing station info.

8. **Final cleaned dataset**  
   - Saved cleaned full-year dataset as `cyclistic_trips_clean.csv` into `Data_Clean/`.  
   - This file will be used for all subsequent analysis and visualizations.

---

## Notes  

- All transformations are performed in **scripts under `Scripts/`**, primarily `01_load_and_clean.R`.  
- No manual editing of the CSV files is done; the cleaning process is **fully reproducible** from the R script.  