#escapement data courtesy of ADFG
library(readxl)
library(readr)
library(data.table)

sockeye_esc <- read_excel("FishCounts_Kenai laterun sockeye (1).xlsx")
#View(FishCounts_Kenai_laterun_sockeye_1_)

date <- as.Date(sockeye_esc$count_date)
filter_sockeye_esc <- sockeye_esc %>% filter(as.Date(sockeye_esc$count_date) >= as.Date("2000-07-18") 
                                             & as.Date(sockeye_esc$count_date) <= as.Date("2013-05-07"))
sockeye_df <- data.frame(
  date = filter_sockeye_esc$count_date, 
  fish_count = filter_sockeye_esc$fish_count)





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
  fish_count = filter_king_total$Total.Run)

