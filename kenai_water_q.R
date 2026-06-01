library(readr)

Temperature_water <- read_csv("Temperature, water Kenai River Baseline Data.csv")
#View(Temperature_water_Kenai_River_Baseline_Data)

date_temp <- Temperature_water$activity_start_date
measured_temp <- Temperature_water$result_measure_value
susp_temp <- Temperature_water$result_measure_measure_unit_code

Turbidity <- read_csv("Turbidity Kenai River Baseline Data.csv")
#View(Turbidity_Kenai_River_Baseline_Data)

date_turbidity <- Turbidity$activity_start_date
measured_turbidity <- Turbidity$result_measure_value
susp_turbidity <- Turbidity$result_measure_measure_unit_code

Total_suspended_solids <- read_csv("Total suspended solids Kenai River Baseline Data.csv")
#View(Total_suspended_solids_Kenai_River_Baseline_Data)

date_susp_solids <- Total_suspended_solids$activity_start_date
measured_susp_solids <- Total_suspended_solids$result_measure_value
susp_solids_unit <- Total_suspended_solids$result_measure_measure_unit_code

Specific_conductance <- read_csv("Specific conductance Kenai River Baseline Data.csv")
#View(Specific_conductance_Kenai_River_Baseline_Data)

date_conductance <- Specific_conductance$activity_start_date
measured_ph <- Specific_conductance$result_measure_value
ph_unit <- Specific_conductance$result_measure_measure_unit_code

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

date_BTEX <- Benzene_toluene_ethyl_benzene_xylenes_mix$activity_start_date
measured_BTEX <- Benzene_toluene_ethyl_benzene_xylenes_mix$result_measure_value
BTEX_unit <- Benzene_toluene_ethyl_benzene_xylenes_mix$result_measure_measure_unit_code


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
calcium_unit <-  Zinc$result_measure_measure_unit_code

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

date_arsenic <- Arsenic$activity_start_date
measured_arsenic <- Arsenic$result_measure_value 
arsenic_unit <-  Arsenic$result_measure_measure_unit_code












