library(readr)
library(data.table)
library(cluster)
library(readxl)
library(dplyr)
library(tidyr)
library(magrittr)
library(ggplot2)
library(factoextra)

#WATER QUALITY DATAFRAME + CLEANUP

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

date_arsenic <- Arsenic$activity_start_date
measured_arsenic <- Arsenic$result_measure_value 
arsenic_unit <-  Arsenic$result_measure_measure_unit_code

#identical(as.integer(date_aresenic, date_cadmium,date_chromium, 
# date_copper, date_lead, date_zinc, date_calcium, date_iron,
#date_magnesium, date_nitrate_nitrate, date_phosphorous, 
#date_benzene, date_fecal, date_ph, date_conductance, 
#date_susp_solids, date_turbidity, date_temp))

date_list <- list(as.integer(
  date_arsenic, date_cadmium,date_chromium, 
  date_copper, date_lead, date_zinc, date_calcium, date_iron,
  date_magnesium, date_nitrate_nitrite, date_phosphorous, 
  date_benzene, date_fecal, date_ph, date_conductance, 
  date_susp_solids, date_turbidity, date_temp 
))

matches <- logical(length(date_list))

for (i in seq_along(date_list)) {
  matches[i] <- identical(as.integer(date_arsenic), date_list[[i]])
}

matches
#output is TRUE indicating that all dates are the same 



#make data frame for all chemicals across dates

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

chemical_name <- c("Temperature", "Turbidity", "Total Suspended Solids", "Specific Conductance", 
                   "pH", "Fecal Coliform", "BTEX", "Phosphorous", "Nitrate/Nitrite", 
                   "Magnesium", "Iron", "Calcium", "Zinc", "Lead", "Copper", "Chromium", 
                   "Cadmium", "Arsenic")

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

wq_wide <- wq_wide[Year >= 2000 & Year <= 2011]

#making wq_wide into a data frame with just these components 
wq_wide <- wq_wide[, c("Year","Total Suspended Solids", "Turbidity", "Temperature"), with = FALSE]

View(wq_wide)
#this wq_wide is our data frame that we can use for clustering. 

wq_wide <- wq_wide %>%
  group_by(Year) %>%
  filter(n() == 2) %>%
  ungroup()



#THIS IS WQ DATA WITHOUT DATE. IF YOU WANT IT WITH DARE JUST GO ABOVE TO VIEW WQ WIDE AND THE 
#LINES THAT MAKE THAT DF. 
pca_data <- wq_wide[, -1]



######################################################

#CHINOOK DATA AND CLEANUP

#CHINOOK ESCAPEMENT DATA LOOK HERE!!

kenai_chinook_and_sockeye_total_run <- read_csv("kenai-chinook-and-sockeye-total-run.csv")
#View(kenai_chinook_and_sockeye_total_run)


setDT(kenai_chinook_and_sockeye_total_run)

#filter_king_total <- filter_king_total[
#as.numeric(Year) >= 2000 & as.numeric(Year) < 2014
#]

filter_king_total <- kenai_chinook_and_sockeye_total_run[Species == "Chinook" & River == "Kenai River" &
                                                           as.numeric(Year) >= 2000 & as.numeric(Year) < 2014  ]


setkey(filter_king_total, Year)

chinook_escapement <- data.frame(
  Year = filter_king_total$Year,
  RunType = filter_king_total$Run.Name,
  fish_count = filter_king_total$Total.Run
)

###########################################

#CREATING COMPLETE DATAFRAME (Water Quality + Chinook)

setDT(chinook_escapement)
setDT(wq_wide)

wq_wide[, seq_id := rowid(Year)]
chinook_escapement[, seq_id := rowid(Year)]

#chinook_yearly_avg <- chinook_escapement[Year >= 2001 & Year <= 2010, 
                                       #  .(avg_fish_count = mean(fish_count)), 
                                        # by = Year]
                                        

#merged_df_chinook <- merge(wq_wide, chinook_yearly_avg, by = "Year", all = FALSE)


merged_df_chinook <- merged_df_chinook[Year >= 2001 & Year <= 2010]

merged_df_chinook <- merged_df_chinook[, !c("Year", "seq_id"), with = FALSE]



wq_wide[, seq_id := rowid(Year)]

pca_chinook_all_data <- merged_df_chinook

scaled_data <- scale(pca_chinook_all_data)

#setkey(chinook_escapement, Year)
#setkey(wq_wide, Year)

#merged_df_chinook <- wq_wide[chinook_escapement, on = .(Year)]
#merged_df_chinook <- merged_df_chinook[Year >= 2001 & Year <= 2010]
#merged_df_chinook <- merged_df_chinook %>% 
  #select(-Year)


#%>%
  #select(-RunType)



################################################

#PCA For Water Quality + Water Quality with Chinook Escapement

#PCA on just water quality 
pr.out <- prcomp(pca_data, scale=TRUE)
names(pr.out)
dim(pr.out$x)

pr.out$rotation
biplot(pr.out, main = "Water Quality", scale=0, xlim=c(-5,5), ylim=c(-5,5))
pr.out$x

pr.out$sdev
pr.var=pr.out$sdev^2
pr.var
pve=pr.var/sum(pr.var)
pve
plot(pve, xlab="Principal Component", 
     ylab="Proportion of Variance Explained",
     main = "Water Quality Proportion of Variance Explained",
     ylim=c(0,1),type='b')
plot(cumsum(pve), xlab="Principal Component", 
     ylab="Cumulative Proportion of Variance Explained", 
     main = "Water Quality Cumulative Proportion of Variance Explained",
     ylim=c(0,1),type='b')


#PCA for data frame that includes CHINOOK Escapement 

pr.out <- prcomp(pca_chinook_all_data, scale=TRUE)
pr.out2 <- pr.out
names(pr.out)
dim(pr.out$x)

pr.out$rotation
biplot(pr.out, main = "Water Quality + Chinook Escapement", scale=0, xlim=c(-5,5), ylim=c(-5,5))
pr.out$x

pr.out$sdev
pr.var=pr.out$sdev^2
pr.var
pve=pr.var/sum(pr.var)
pve
plot(pve, xlab="Principal Component", 
     ylab="Proportion of Variance Explained",
     main = "Water Quality + Chinook Escapement PVE",
     ylim=c(0,1),type='b')
plot(cumsum(pve), xlab="Principal Component", 
     ylab="Cumulative Proportion of Variance Explained",
     main = "Water Quality + Chinook Escapement Cumulative PVE",
     ylim=c(0,1),type='b')



####################################################

#CLUSTERING

components = pr.out$x[, 1:5] # however many components used
Knum = 2 # number of clusters

km.out = kmeans(components, Knum, nstart=20) 

# silhouette is one metric to measure the goodness of fit of clusters, think of it like R^2
sil_score = silhouette(km.out$cluster, dist(components))
avg_sil = mean(sil_score[, 3])
avg_sil

##### CHOICE IN K (automated)

#set.seed(1)

#fviz_nbclust(components, kmeans, method = "silhouette", k.max = 8) +
  labs(subtitle = "Silhouette Method for Optimal K")


#fviz_nbclust(merged_df_chinook, kmeans, method = "wss", k.max = 30)
#####
for (i in 1:Knum) {
  row_indices <- which(km.out$cluster == i)
  
  #print whatever we want to see from each cluster, I was thinking dates but we can change it
  cluster_data <- pca_chinook_all_data[row_indices, "fish_count"]
  
  print(cluster_data)
  cat("\n")
}

#Plotting chinook data clusters

km8 <- kmeans(components, 8, nstart = 20)
print(km8)

plot_df <- data.frame(
  PC1 = components[,1],
  PC2 = components[,2],
  cluster = factor(km4$cluster)
)

ggplot(plot_df,
       aes(PC1, PC2, color = cluster)) +
  geom_point(size = 4) +
  stat_ellipse(aes(group = cluster)) +
  theme_bw()

#################

# Turn PCA chemical data back into a data.table
pca_dt <- as.data.table(pca_chinook_all_data)

#add cluster assignments from your k-means model as a new column
pca_dt[, cluster := km.out$cluster]

# calculate the average of every chemical column grouped by cluster
# (.SD tells data.table to calculate the mean for all columns except the 'cluster' column)
chemical_centroids <- pca_dt[, lapply(.SD, mean, na.rm = TRUE), by = cluster]

# view the chemical profile for the center of each cluster
print(chemical_centroids)

