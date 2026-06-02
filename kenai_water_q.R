library(readr)
library(data.table)

Temperature_water <- read_csv("Temperature, water Kenai River Baseline Data.csv")
#View(Temperature_water_Kenai_River_Baseline_Data)

date_temp <- Temperature_water$activity_start_date
measured_temp <- Temperature_water$result_measure_value
temp_unit <- Temperature_water$result_measure_measure_unit_code
name_temp <- Temperature_water$characteristic_name

Turbidity <- read_csv("Turbidity Kenai River Baseline Data.csv")
#View(Turbidity_Kenai_River_Baseline_Data)

date_turbidity <- Turbidity$activity_start_date
measured_turbidity <- Turbidity$result_measure_value
turbidity_unit <- Turbidity$result_measure_measure_unit_code

Total_suspended_solids <- read_csv("Total suspended solids Kenai River Baseline Data.csv")
#View(Total_suspended_solids_Kenai_River_Baseline_Data)

date_susp_solids <- Total_suspended_solids$activity_start_date
measured_susp_solids <- Total_suspended_solids$result_measure_value
susp_solids_unit <- Total_suspended_solids$result_measure_measure_unit_code

Specific_conductance <- read_csv("Specific conductance Kenai River Baseline Data.csv")
#View(Specific_conductance_Kenai_River_Baseline_Data)

date_conductance <- Specific_conductance$activity_start_date
measured_conductance <- Specific_conductance$result_measure_value
conductance_unit <- Specific_conductance$result_measure_measure_unit_code

pH <- read_csv("pH Kenai River Baseline Data.csv")
#View(pH_Kenai_River_Baseline_Data)

date_ph <- pH$activity_start_date
measured_ph <- pH$result_measure_value
ph_unit <- pH$result_measure_measure_unit_code

Fecal_Coliform <- read_csv("Fecal Coliform Kenai River Baseline Data.csv")
#View(Fecal_Coliform_Kenai_River_Baseline_Data)

date_fecal <- Fecal_Coliform$activity_start_date
measured_fecal <- Fecal_Coliform$result_measure_value
fecal_unit <- Fecal_Coliform$result_measure_measure_unit_code

Benzene_toluene_ethyl_benzene_xylenes_mix <- read_csv("Benzene, toluene, ethyl benzene, xylenes mix Kenai River Baseline Data.csv")
#View(Benzene_toluene_ethyl_benzene_xylenes_mix_Kenai_River_Baseline_Data)

date_benzene <- Benzene_toluene_ethyl_benzene_xylenes_mix$activity_start_date
measured_benzene <- Benzene_toluene_ethyl_benzene_xylenes_mix$result_measure_value
benzene_unit <- Benzene_toluene_ethyl_benzene_xylenes_mix$result_measure_measure_unit_code


Phosphorus <- read_csv("Phosphorus Kenai River Baseline Data.csv")
#View(Phosphorus_Kenai_River_Baseline_Data)

date_phosphorous <- Phosphorus$activity_start_date
measured_phosphorous <- Phosphorus$result_measure_value
phosphorous_unit <- Phosphorus$result_measure_measure_unit_code

Nitrate_Nitrite <- read_csv("Nitrate + Nitrite Kenai River Baseline Data.csv")
#View(Nitrate_Nitrite_Kenai_River_Baseline_Data)

date_nitrate_nitrite <- Nitrate_Nitrite$activity_start_date
measured_nitrate_nitrite <- Nitrate_Nitrite$result_measure_value
nitrate_nitrite_unit <- Nitrate_Nitrite$result_measure_measure_unit_code

Magnesium <- read_csv("Magnesium Kenai River Baseline Data.csv")
#View(Magnesium_Kenai_River_Baseline_Data)

date_magnesium <- Magnesium$activity_start_date
measured_magnesium <- Magnesium$result_measure_value
magnesium_unit <- Magnesium$result_measure_measure_unit_code

Iron <- read_csv("Iron Kenai River Baseline Data.csv")
#View(Iron_Kenai_River_Baseline_Data)

date_iron <- Iron$activity_start_date
measured_iron <- Iron$result_measure_value
iron_unit <- Iron$result_measure_measure_unit_code

Calcium <- read_csv("Calcium Kenai River Baseline Data.csv")
#View(Calcium_Kenai_River_Baseline_Data)

date_calcium <- Calcium$activity_start_date
measured_calcium <- Calcium$result_measure_value
calcium_unit <- Calcium$result_measure_measure_unit_code

Zinc <- read_csv("Zinc Kenai River Baseline Data.csv")
#View(Zinc_Kenai_River_Baseline_Data)

date_zinc <- Zinc$activity_start_date
measured_zinc <- Zinc$result_measure_value 
zinc_unit <-  Zinc$result_measure_measure_unit_code

Lead<- read_csv("Lead Kenai River Baseline Data.csv")
#View(Lead_Kenai_River_Baseline_Data)

date_lead <- Lead$activity_start_date
measured_lead <- Lead$result_measure_value 
lead_unit <-  Lead$result_measure_measure_unit_code

Copper <- read_csv("Copper Kenai River Baseline Data.csv")
#View(Copper_Kenai_River_Baseline_Data)

date_copper <- Copper$activity_start_date
measured_copper <- Copper$result_measure_value 
copper_unit <-  Copper$result_measure_measure_unit_code

Chromium <- read_csv("Chromium Kenai River Baseline Data.csv")
#View(Chromium_Kenai_River_Baseline_Data)

date_chromium <- Chromium$activity_start_date
measured_chromium <- Chromium$result_measure_value 
chromium_unit <-  Chromium$result_measure_measure_unit_code

Cadmium <- read_csv("Cadmium Kenai River Baseline Data.csv")
#View(Cadmium_Kenai_River_Baseline_Data)

date_cadmium <- Cadmium$activity_start_date
measured_cadmium <- Cadmium$result_measure_value 
cadmium_unit <-  Cadmium$result_measure_measure_unit_code

Arsenic <- read_csv("Arsenic Kenai River Baseline Data (1).csv")
#View(Arsenic_Kenai_River_Baseline_Data_1_)

date_aresenic <- Arsenic$activity_start_date
measured_arsenic <- Arsenic$result_measure_value 
arsenic_unit <-  Arsenic$result_measure_measure_unit_code

#identical(as.integer(date_aresenic, date_cadmium,date_chromium, 
         # date_copper, date_lead, date_zinc, date_calcium, date_iron,
          #date_magnesium, date_nitrate_nitrate, date_phosphorous, 
          #date_benzene, date_fecal, date_ph, date_conductance, 
          #date_susp_solids, date_turbidity, date_temp))

date_list <- list(as.integer(
  date_aresenic, date_cadmium,date_chromium, 
  date_copper, date_lead, date_zinc, date_calcium, date_iron,
  date_magnesium, date_nitrate_nitrate, date_phosphorous, 
  date_benzene, date_fecal, date_ph, date_conductance, 
  date_susp_solids, date_turbidity, date_temp 
))

matches <- logical(length(date_list))

for (i in seq_along(date_list)) {
  matches[i] <- identical(as.integer(date_aresenic), date_list[[i]])
}

matches
#output is TRUE indicating that all dates are the same 

#make data frame for all chemicals across dates

chemicals_kwf <- c(measured_arsenic, measured_cadmium,measured_chromium, 
                   measured_copper, measured_lead, measured_zinc, measured_calcium, measured_iron,
                   measured_magnesium, measured_nitrate_nitrite, measured_phosphorous, 
                   measured_benzene, measured_fecal, measured_ph, measured_conductance, 
                   measured_susp_solids, measured_turbidity, measured_temp)

chemical_name <- list(c("Aresenic", "Cadmium", "Chromium", "Copper", "Lead", "Zinc", "Calcium", 
                   "Iron", "Magnesium", "Nitrate_nitrite", "Phosphorous", "Benzene", "Fecal Coliform", 
                   "Ph", "Conductance", "Suspended Solids", "Turbidity", "Surface Temperature"))

chemicals_unit <- c(arsenic_unit, cadmium_unit,chromium_unit, 
                             copper_unit, lead_unit, zinc_unit, calcium_unit, iron_unit,
                             magnesium_unit, nitrate_nitrite_unit, phosphorous_unit, 
                            benzene_unit, fecal_unit, ph_unit, conductance_unit, 
                             susp_solids_unit, turbidity_unit, temp_unit)

#wq_data_frame <- data.frame(
  #date = date_aresenic,
  #chemical = chemical_name, 
  #concentration = chemicals_kwf,
  #unit = chemicals_unit
#)

#we should still add sediment data to this, as well as flow rate and river temp. 
#but this is the general framework
sample_features <- data_long %>%
  pivot_wider(
    names_from = chemical,       # moves chemical names to the top row
    values_from = concentration  # fills the cells with the concentrations
  )

    
library(readr)
library(dplyr)

files <- c(
  "Temperature, water Kenai River Baseline Data.csv",
  "Turbidity Kenai River Baseline Data.csv",
  "Total suspended solids Kenai River Baseline Data.csv",
  "Specific conductance Kenai River Baseline Data.csv",
  "pH Kenai River Baseline Data.csv",
  "Fecal Coliform Kenai River Baseline Data.csv",
  "Benzene, toluene, ethyl benzene, xylenes mix Kenai River Baseline Data.csv",
  "Phosphorus Kenai River Baseline Data.csv",
  "Nitrate + Nitrite Kenai River Baseline Data.csv",
  "Magnesium Kenai River Baseline Data.csv",
  "Iron Kenai River Baseline Data.csv",
  "Calcium Kenai River Baseline Data.csv",
  "Zinc Kenai River Baseline Data.csv",
  "Lead Kenai River Baseline Data.csv",
  "Copper Kenai River Baseline Data.csv",
  "Chromium Kenai River Baseline Data.csv",
  "Cadmium Kenai River Baseline Data.csv",
  "Arsenic Kenai River Baseline Data (1).csv"
)

chemical_name <- c("Aresenic", "Cadmium", "Chromium", "Copper", "Lead", "Zinc", "Calcium", 
                        "Iron", "Magnesium", "Nitrate_nitrite", "Phosphorous", "Benzene", "Fecal Coliform", 
                        "Ph", "Conductance", "Suspended Solids", "Turbidity", "Surface Temperature")


wq_data_frame <- bind_rows(
  lapply(seq_along(files), function(i) {
    
    dat <- read_csv(files[i], show_col_types = FALSE)
    
    data.frame(
      date = dat$activity_start_date,
      chemical_name = chemical_name[i],
      concentration = dat$result_measure_value,
      unit = dat$result_measure_measure_unit_code
    )
    
  })
)



View(wq_data_frame)

#concentration <- mean(concentration)
library(tidyr)
library(dplyr)

wq_wide <- wq_data_frame %>%
  group_by(date, chemical_name) %>%
  summarise(
    concentration = mean(concentration, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  pivot_wider(
    names_from = chemical_name,
    values_from = concentration, 
    values_fill = 0 )


wq_wide <- wq_wide %>%
  mutate(
    across(
      where(is.numeric),
      ~ ifelse(is.na(.x) | is.nan(.x), 0, .x)
    )
  )


#WQ WIDE DATA TABLE FOR USE IN CLUSTERING AND PCA

setDT(wq_wide)

wq_wide[, Year := as.numeric(substr(date, 1, 4))]

wq_wide[, date := NULL]

setcolorder(wq_wide, "Year")

View(wq_wide)
#this wq_wide is our data frame that we can use for clustering. 


View(wq_wide)

#THIS IS WQ DATA WITHOUT DATE. IF YOU WANT IT WITH DARE JUST GO ABOVE TO VIEW WQ WIDE AND THE 
#LINES THAT MAKE THAT DF. 
pca_data <- wq_wide[, -1]
