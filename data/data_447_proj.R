library(readxl)
library(readr)
library(dplyr)
library(tidyr)

#water quality data below from monitoring site Kenai R at Soldotna AK - USGS-15266300

sockeye_counts <- read_excel("FishCounts_Kenai laterun sockeye (1).xlsx")
View(sockeye_counts)

basicphyschem <- read_csv("basicphyschem.csv")
View(basicphyschem)

fullphyschem <- read_csv("fullphyschem (2).csv")
View(fullphyschem_2_)

year_range <- USGS_15266300_1_$mostRecentActivity -
  USGS_15266300_1_$firstActivity

top10_indices <- order(year_range, decreasing = TRUE)[1:10]

top10_indices
#253 (Temperature, water) 249 (Stream flow, instantaneous) , (these are a part of the daily
# monitoring data, eg why they are th longest time periods)
#23 (Calcium)  25 (Magnesium)  33 (Acidity, (H+))  
#34 (Alkalinity)  43 (Carbon dioxide)  45 (Chloride)  48 (Fluoride) 52 (Silica)

plot(sockeye_counts$year, sockeye_counts$fish_count, type="l")

#Result_Characteristic (Chemical Type)
#Result measure 
#Result_MeasureUnit

#make dataframe 
chemicals <- fullphyschem$Result_Characteristic
concentrations <- fullphyschem$Result_Measure
dates <- fullphyschem$Activity_StartDate
ordered_date <- order(as.Date(dates))

dates_o <- dates[ordered_date]
chemicals_ordered <- chemicals[ordered_date]
concentrations_ordered <- concentrations[ordered_date]

#iron, phosphorous, want to add, check data collection dates

data_long<- data.frame(
  date = dates_o,
  chemical = chemicals_ordered, #concatenate extra data columns? 
  concentration = concentrations_ordered
)

#we should still add sediment data to this, as well as flow rate and river temp. 
#but this is the general framework
sample_features <- data_long %>%
  pivot_wider(
    names_from = chemical,       # moves chemical names to the top row
    values_from = concentration  # fills the cells with the concentrations
  )





