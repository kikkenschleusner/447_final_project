library(data.table)


setDT(sockeye_df)
setDT(wq_wide)


sockeye_df[, date := as.Date(sockeye_df$date)]
wq_wide[, date := as.Date(wq_wide$date)]


setkey(sockeye_df, date)
setkey(wq_wide, date)

merged_df <- wq_wide[sockeye_df, on = .(date), roll = TRUE]

pca_data_all_data <- merged_df[, -1]

#now just with chinook salmon data 
#IMPORTANT NOTE:
#I dont think this is correct, this should have around 70 observations per feature. 
setDT(chinook_escapement)
setDT(wq_wide)


#chinook_escapement[, date := as.Date(chinook_escapement$date)]
#wq_wide[, Year := substr(date, 1, 4)]
#wq_wide[, date := as.Date(wq_wide$date)]


setkey(chinook_escapement, Year)
setkey(wq_wide, Year)

#merged_df_chinook <- wq_wide[chinook_escapement, on = .(date), roll = TRUE]
merged_df_chinook <- wq_wide[chinook_escapement, on = .(Year)]

pca_chinook_all_data <- merged_df_chinook[, -1]
