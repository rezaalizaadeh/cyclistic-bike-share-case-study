# Data Sources – Cyclistic Case Study  

## Source  

All data comes from the public Divvy bike-share system, provided by Motivate International Inc.  
For this case study, Divvy is used as the fictional **Cyclistic** dataset.

Official data access and license:  
- https://divvybikes.com/system-data  
- License: https://www.divvybikes.com/data-license-agreement  

The license permits analysis and visualization of the data for non-commercial purposes.

---

## Time Range Used  

The analysis uses **12 months of historical trip data**:

- From **November 2024**  
- Through **October 2025**

---

## Files Included  

Monthly trip data files (CSV format, raw) stored in `Data_Raw/`:

- `202411-divvy-tripdata.csv`  
- `202412-divvy-tripdata.csv`  
- `202501-divvy-tripdata.csv`  
- `202502-divvy-tripdata.csv`  
- `202503-divvy-tripdata.csv`  
- `202504-divvy-tripdata.csv`  
- `202505-divvy-tripdata.csv`  
- `202506-divvy-tripdata.csv`  
- `202507-divvy-tripdata.csv`  
- `202508-divvy-tripdata.csv`  
- `202509-divvy-tripdata.csv`  
- `202510-divvy-tripdata.csv`  

(Exact filenames may differ slightly depending on the downloaded data; this list represents the intended 12-month range.)

---

## Key Fields  

Shared core columns across all monthly files (after standardization):  

- `ride_id` – Unique trip identifier  
- `rideable_type` – Bike type (classic_bike, electric_bike, etc.)  
- `started_at` – Trip start date and time (timestamp)  
- `ended_at` – Trip end date and time (timestamp)  
- `start_station_name` – Starting station (string)  
- `start_station_id` – Starting station ID  
- `end_station_name` – Ending station (string)  
- `end_station_id` – Ending station ID  
- `start_lat`, `start_lng` – Starting coordinates  
- `end_lat`, `end_lng` – Ending coordinates  
- `member_casual` – Rider type (`member` or `casual`)  

Additional derived fields created during cleaning:  

- `ride_length` – Length of each ride (in minutes / seconds)  
- `day_of_week` – Day of week the ride started (Sunday–Saturday)  

---

## Data Quality & Limitations  

- No **personally identifiable information (PII)** is included (no names, phone numbers, or addresses).  
- We cannot directly link riders to home or work locations or to payment information.  
- Weather, demographics, and pricing data are **not** included; any conclusions are based only on trip patterns.  
- Some trips may have **missing station names/IDs** or **invalid timestamps**; these are handled during cleaning and may be excluded from analysis.  

Despite these limitations, the data is appropriate for answering the business question about **usage differences between casual riders and members**.