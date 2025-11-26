# Cyclistic Case Study – Project Plan  

---

## 1. Business Task  

Cyclistic wants to increase annual memberships because members are more profitable than casual riders.  
The marketing team needs to understand how annual members and casual riders use the Cyclistic bike-share system differently.

Your task is to analyze **12 months of historical trip data** and provide:  

1. Key differences in usage patterns between **casual** and **member** riders.  
2. Insights supported by **data and visualizations**.  
3. **Three actionable recommendations** for converting casual riders into annual members.

---

## 2. Key Stakeholders  

- **Lily Moreno** – Director of Marketing (project sponsor)  
- **Cyclistic Marketing Analytics Team** – data analysts supporting strategy  
- **Cyclistic Executive Team** – final decision-makers approving campaigns and budgets  

---

## 3. Tools to Be Used  

- **R / RStudio** – primary tool for data loading, cleaning, merging, and analysis  
- **tidyverse (dplyr, ggplot2, lubridate)** – data wrangling and visualizations in R  
- **Tableau or Power BI / or RMarkdown** – final visualizations and dashboard or report  
- **GitHub / online portfolio** – sharing the final case study and code  

---

## 4. Project Phases (Ask – Prepare – Process – Analyze – Share – Act)  

### Phase 1 – Ask  
- Clarify the business task.  
- Write the primary and secondary questions (see `business_task.md`).  

### Phase 2 – Prepare  
- Download the 12 monthly Divvy tripdata files.  
- Store them in `Data_Raw/` with clear, consistent names.  
- Document data sources and license in `data_sources.md`.  

### Phase 3 – Process  
- Use R scripts (starting with `01_load_and_clean.R`) to:  
  - Load all monthly CSVs.  
  - Standardize columns.  
  - Merge into a single dataframe.  
  - Create `ride_length` and `day_of_week`.  
  - Remove invalid records.  
- Log all cleaning decisions in `cleaning_log.md`.  

### Phase 4 – Analyze  
- Perform descriptive analysis in R:  
  - Distribution of `ride_length` by `member_casual`.  
  - Number of rides by `day_of_week` and `member_casual`.  
  - Rides by month/season and time of day.  
  - Station-level patterns (top start and end stations for each rider type).  
- Create summary tables and export them to `Analysis/` and/or `Data_Clean/`.

### Phase 5 – Share  
- Build visualizations (in R/ggplot2 and/or Tableau):  
  - Average ride length by rider type and day of week.  
  - Number of rides by month and rider type.  
  - Popular stations for casual vs. member riders.  
- Prepare a slide deck or RMarkdown/HTML report summarizing key insights.  
- Save final visuals in `Visuals/`.

### Phase 6 – Act  
- Formulate **three key recommendations** for marketing actions (e.g., targeted promotions, weekend passes, station-based campaigns).  
- Add these recommendations and supporting evidence to the final report.  
- Publish the finished case study (code + report + visuals) to an online portfolio or GitHub.

---

## 5. Deliverables  

1. **Cleaned full-year dataset** (`cyclistic_trips_clean.csv`).  
2. **Analysis outputs** (summary tables, R scripts) in `Analysis/` and `Scripts/`.  
3. **Visualizations** in `Visuals/`.  
4. **Written documentation**:  
   - `business_task.md`  
   - `data_sources.md`  
   - `cleaning_log.md`  
   - Final report / presentation with three recommendations.  