Cyclistic Bike-Share Case Study

Google Data Analytics Capstone | R, Data Cleaning, Analysis, and Visualization

This project analyzes 12 months of Cyclistic bike-share data to understand the usage differences between casual riders and annual members, aiming to help the company optimize marketing strategies and convert more casual users into members.

⸻

📁 Project Structure
cyclistic-bike-share-case-study/
│
├── Data/
│   ├── Data_Raw.txt          # Raw dataset description/placeholder
│   ├── Data_Clean.txt        # Cleaned dataset description/placeholder
│
├── Docs/
│   ├── business_task.md      # Business questions + stakeholders
│   ├── cleaning_log.md       # Data cleaning decisions & assumptions
│   ├── data_sources.md       # Dataset source and citations
│   ├── project_plan.md       # High-level project planning
│
├── Final_report/
│   ├── Cyclistic_Case_Study.Rmd     # Full R Markdown analysis
│   ├── Cyclistic_Case_Study.html    # HTML final report
│   ├── Cyclistic_Case_Study.pdf     # PDF final report
│
├── Scripts/
│   ├── load_and_clean.R      # Load data + cleaning + feature creation
│   ├── analysis.R            # Exploratory analysis + summary tables
│   ├── visualizations.R      # All ggplot2 charts exported to /Visuals
│
├── Summaries/
│   ├── hourly_summary.csv
│   ├── weekday_summary.csv
│   ├── monthly_summary.csv
│
├── Visuals/
│   ├── box_duration.png
│   ├── heatmap_hour_weekday.png
│   ├── hourly_rides.png
│   ├── monthly_rides.png
│   ├── share_rides.png
│   ├── top_routes.png
│   ├── top_start_stations.png
│   ├── weekday_rides.png
│   ├── weekday_duration.png
│
└── README.md

🧼 Data Cleaning (R)

Key steps (see Scripts/load_and_clean.R and Docs/cleaning_log.md):
	•	Combined 12 months of bike-share data into a single dataset
	•	Removed:
	•	duplicate entries
	•	negative/zero ride durations
	•	missing station names or user type
	•	Converted timestamps and engineered new features:
	•	ride_length (minutes)
	•	day_of_week
	•	month
	•	hour_of_day
	•	ride_type labels (member vs casual)

All cleaning logic follows the Google Analytics Capstone framework.

⸻

📊 Exploratory Analysis

Conducted in Scripts/analysis.R:
	•	Trip frequency trends
	•	Differences in ride duration
	•	Day-of-week patterns
	•	Seasonal patterns
	•	Usage by hour of day
	•	Most popular start/end stations
	•	Comparison of member vs casual riders

Summary CSVs are available in Summaries/.

⸻

📈 Visualizations (ggplot2)

All visuals created in Scripts/visualizations.R and exported to Visuals/:
	•	Hourly ride trends
	•	Monthly usage patterns
	•	Weekday vs weekend behavior
	•	Distribution of ride lengths
	•	Top stations
	•	Top routes
	•	Heatmap (hour × weekday) of ride activity

Plots were also used in Tableau for dashboard creation.

⸻

📄 Final Deliverables

Located in Final_report/:
	•	R Markdown analysis
	•	HTML report
	•	PDF report
	•	Tableau dashboards included in visuals directory (optional)

⸻

🎯 Key Insights
	•	Members ride more frequently but with shorter trip durations
	•	Casual riders take longer recreational trips, mostly on weekends
	•	The best strategy for conversion:
	•	Promote annual membership to weekend/seasonal users
	•	Target high-traffic stations used mostly by casuals
	•	Offer membership discounts during peak casual months

⸻

🛠 Tools Used
	•	R (tidyverse, lubridate, ggplot2, dplyr)
	•	R Markdown
	•	Tableau Public
	•	GitHub
	•	CSV data files (12 months)

⸻

📬 Contact

Created by Reza Mahin Mohammadzadeh
If you found this project useful, feel free to connect:
	•	GitHub: [https://github.com/rezaalizaadeh](https://www.linkedin.com/in/reza-alizadeh-6a5847244/)
	•	Tableau Public: [https://public.tableau.com/app/profile/reza.mahin](https://public.tableau.com/app/profile/reza.mahin.mohammadalizadeh/vizzes)
