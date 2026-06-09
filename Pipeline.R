rm(list = ls())

library(readr)
library(readxl)
library(dplyr)
library(tidyr)
library(data.table)


#===============================================================================
# Water Quality Data

wq_files <- c(
  "data/Arsenic Kenai River Baseline Data (1).csv",
  "data/Cadmium Kenai River Baseline Data.csv",
  "data/Chromium Kenai River Baseline Data.csv",
  "data/Copper Kenai River Baseline Data.csv",
  "data/Lead Kenai River Baseline Data.csv",
  "data/Zinc Kenai River Baseline Data.csv",
  "data/Calcium Kenai River Baseline Data.csv",
  "data/Iron Kenai River Baseline Data.csv",
  "data/Magnesium Kenai River Baseline Data.csv",
  "data/Nitrate + Nitrite Kenai River Baseline Data.csv",
  "data/Phosphorus Kenai River Baseline Data.csv",
  "data/Benzene, toluene, ethyl benzene, xylenes mix Kenai River Baseline Data.csv",
  "data/Fecal Coliform Kenai River Baseline Data.csv",
  "data/pH Kenai River Baseline Data.csv",
  "data/Specific conductance Kenai River Baseline Data.csv",
  "data/Total suspended solids Kenai River Baseline Data.csv",
  "data/Turbidity Kenai River Baseline Data.csv",
  "data/Temperature, water Kenai River Baseline Data.csv"
)

wq_labels <- c(
  "Arsenic", "Cadmium", "Chromium", "Copper", "Lead", "Zinc",
  "Calcium", "Iron", "Magnesium", "Nitrate_Nitrite", "Phosphorus",
  "Benzene_BTEX", "Fecal_Coliform", "pH", "Conductance",
  "Suspended_Solids", "Turbidity", "Temp_Water"
)

wq_long <- bind_rows(
  lapply(seq_along(wq_files), function(i) {
    dat <- read_csv(wq_files[i], show_col_types = FALSE)
    data.frame(
      date = as.Date(dat$activity_start_date),
      chemical = wq_labels[i],
      concentration = dat$result_measure_value,
      unit = dat$result_measure_measure_unit_code
    )
  })
)

wq_data <- wq_long %>%
  group_by(date, chemical) %>%
  summarise(concentration = mean(concentration, na.rm = TRUE), .groups = "drop")

wq_wide <- wq_data %>%
  pivot_wider(
    names_from  = chemical,
    values_from = concentration,
    values_fill = NA # NA rather than 0 to not misrepresent non-detects
  )

setDT(wq_wide)
wq_wide[, Year  := as.integer(format(date, "%Y"))]
wq_wide[, Month := as.integer(format(date, "%m"))]

wq_wide <- wq_wide[Year >= 2000 & Year <= 2013]


# Years with only one sample so we try to use them for both early and late run
single_sample_years <- wq_wide[, .N, by = Year][N == 1, Year]

wq_early <- wq_wide[Month < 6 | Year %in% single_sample_years][
  , .SD[which.min(date)], by = Year
]

wq_late <- wq_wide[Month >= 6 | Year %in% single_sample_years][
  , .SD[which.max(date)], by = Year
]

setkey(wq_early, Year)
setkey(wq_late,  Year)


wq_annual <- wq_wide[,
                     lapply(.SD, mean, na.rm = TRUE),
                     by     = Year,
                     .SDcols = wq_labels
]
setkey(wq_annual, Year)


#===============================================================================
# Salmon Data

sockeye_raw <- read_excel("data/FishCounts_Kenai laterun sockeye (1).xlsx")

sockeye_annual <- sockeye_raw %>%
  mutate(
    date = as.Date(count_date),
    Year = as.integer(format(date, "%Y"))
  ) %>%
  filter(Year >= 2000, Year <= 2013) %>%
  group_by(Year) %>%
  summarise(sockeye_count = sum(fish_count, na.rm = TRUE), .groups = "drop")

setDT(sockeye_annual)
setkey(sockeye_annual, Year)

# Chinook
kenai_runs_raw <- read_csv("kenai-chinook-and-sockeye-total-run.csv",
                           show_col_types = FALSE)
setDT(kenai_runs_raw)

chinook_annual <- kenai_runs_raw[
  Species == "Chinook" &
    River   %in% c("Russian River", "Kenai River") &
    as.integer(Year) >= 2000 &
    as.integer(Year) <= 2013,
  .(Year = as.integer(Year), Run.Name, chinook_count = Total.Run)
]
setkey(chinook_annual, Year)

#===============================================================================
# Dataframes for analysis stuff


#  Water quality only
wq_only <- rbind(
  copy(wq_early)[, Season := "Early"],
  copy(wq_late)[ , Season := "Late"]
)[order(Year, Season)]
wq_only[, c("date", "Month") := NULL]


# Water quality + Chinook early run (Russian River) and Chinook late run (Kenai River)
chinook_early_run <- chinook_annual[Run.Name == "Early Run"]
chinook_late_run  <- chinook_annual[Run.Name == "Late Run"]

wq_chinook_early <- wq_early[chinook_early_run, on = "Year", nomatch = 0]
wq_chinook_early[, c("date", "Month") := NULL]

wq_chinook_late <- wq_late[chinook_late_run, on = "Year", nomatch = 0]
wq_chinook_late[, c("date", "Month") := NULL]


# Water quality + Sockeye
wq_sockeye <- wq_annual[sockeye_annual, on = "Year", nomatch = 0]




#===============================================================================
# PCA

# PCA on water quality only
pca_data <- as.matrix(wq_only[, !c("Year", "Season"), with = FALSE])
for (j in seq_len(ncol(pca_data))) {
  na_idx <- is.na(pca_data[, j])
  if (any(na_idx)) pca_data[na_idx, j] <- mean(pca_data[, j], na.rm = TRUE)
}

pr.out  <- prcomp(pca_data, scale = TRUE)
names(pr.out)
dim(pr.out$x)
pr.out$rotation
biplot(pr.out, scale = 0, xlim = c(-5, 5), ylim = c(-5, 5),
       main = "WQ only Biplot")
pr.out$x
pr.out$sdev
pr.var <- pr.out$sdev^2
pr.var
pve <- pr.var / sum(pr.var)
pve
plot(pve,
     xlab = "Principal Component",
     ylab = "Proportion of Variance Explained",
     ylim = c(0, 1), type = "b",
     main = "WQ Only Scree")
plot(cumsum(pve),
     xlab = "Principal Component",
     ylab = "Cumulative Proportion of Variance Explained",
     ylim = c(0, 1), type = "b",
     main = "WQ Only Cumulative PVE")


# PCA on water quality + Chinook early run (Russian River)
pca_chinook_early <- as.matrix(wq_chinook_early[, !c("Year", "Run.Name"), with = FALSE])
for (j in seq_len(ncol(pca_chinook_early))) {
  na_idx <- is.na(pca_chinook_early[, j])
  if (any(na_idx)) pca_chinook_early[na_idx, j] <- mean(pca_chinook_early[, j], na.rm = TRUE)
}

pr.out  <- prcomp(pca_chinook_early, scale = TRUE)
names(pr.out)
pr.out$rotation
biplot(pr.out, scale = 0, xlim = c(-5, 5), ylim = c(-5, 5),
       main = "WQ + Chinook Early Run Biplot")
pr.out$x
pr.out$sdev
pr.var <- pr.out$sdev^2
pr.var
pve <- pr.var / sum(pr.var)
pve
plot(pve,
     xlab = "Principal Component",
     ylab = "Proportion of Variance Explained",
     ylim = c(0, 1), type = "b",
     main = "WQ + Chinook Early Run Scree")
plot(cumsum(pve),
     xlab = "Principal Component",
     ylab = "Cumulative Proportion of Variance Explained",
     ylim = c(0, 1), type = "b",
     main = "WQ + Chinook Early Run Cumulative PVE")



# PCA on water quality + Chinook late run (Kenai River)
pca_chinook_late <- as.matrix(wq_chinook_late[, !c("Year", "Run.Name"), with = FALSE])
for (j in seq_len(ncol(pca_chinook_late))) {
  na_idx <- is.na(pca_chinook_late[, j])
  if (any(na_idx)) pca_chinook_late[na_idx, j] <- mean(pca_chinook_late[, j], na.rm = TRUE)
}

pr.out  <- prcomp(pca_chinook_late, scale = TRUE)
names(pr.out)
dim(pr.out$x)
pr.out$rotation
biplot(pr.out, scale = 0, xlim = c(-5, 5), ylim = c(-5, 5), 
       main = "WQ + Chinook Late Run Biplot")
pr.out$x
pr.out$sdev
pr.var <- pr.out$sdev^2
pr.var
pve <- pr.var / sum(pr.var)
pve
plot(pve,
     xlab = "Principal Component",
     ylab = "Proportion of Variance Explained",
     ylim = c(0, 1), type = "b",
     main = "WQ + Chinook Late Run Scree")
plot(cumsum(pve),
     xlab = "Principal Component",
     ylab = "Cumulative Proportion of Variance Explained",
     ylim = c(0, 1), type = "b",
     main = "WQ + Chinook Late Run Cumulative PVE")



# PCA on water quality + Sockeye (late run)
pca_sockeye <- as.matrix(wq_sockeye[, !"Year", with = FALSE])
for (j in seq_len(ncol(pca_sockeye))) {
  na_idx <- is.na(pca_sockeye[, j])
  if (any(na_idx)) pca_sockeye[na_idx, j] <- mean(pca_sockeye[, j], na.rm = TRUE)
}

pr.out  <- prcomp(pca_sockeye, scale = TRUE)
names(pr.out)
dim(pr.out$x)
pr.out$rotation
biplot(pr.out, scale = 0, xlim = c(-5, 5), ylim = c(-5, 5),
       main = "WQ + Sockeye Biplot")
pr.out$x
pr.out$sdev
pr.var <- pr.out$sdev^2
pr.var
pve <- pr.var / sum(pr.var)
pve
plot(pve,
     xlab = "Principal Component",
     ylab = "Proportion of Variance Explained",
     ylim = c(0, 1), type = "b",
     main = "WQ + Sockeye Scree")
plot(cumsum(pve),
     xlab = "Principal Component",
     ylab = "Cumulative Proportion of Variance Explained",
     ylim = c(0, 1), type = "b",
     main = "WQ + Sockeye Cumulative PVE")



#Note, not really sure how to interpret these


#===============================================================================
# Clustering but would probably exclude pca because they're hard to interpret



# Water quality only clustering then overlay fish












# Water quality plus chinook early run clustering






# Water quality plus chinook late run clustering







# Water quality plus sockeye


















