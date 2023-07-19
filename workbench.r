# Initial setup - enabling tidyverse packages
install.packages("tidyverse")
library(tidyverse)


# Importing all necessary data
june2022 <- read_csv("csv/202206-divvy-tripdata.csv")
july2022 <- read_csv("csv/202207-divvy-tripdata.csv")
august2022 <- read_csv("csv/202208-divvy-tripdata.csv")
september2022 <- read_csv("csv/202209-divvy-tripdata.csv")
october2022 <- read_csv("csv/202210-divvy-tripdata.csv")
november2022 <- read_csv("csv/202211-divvy-tripdata.csv")
december2022 <- read_csv("csv/202212-divvy-tripdata.csv")
january2023 <- read_csv("csv/202301-divvy-tripdata.csv")
february2023 <- read_csv("csv/202302-divvy-tripdata.csv")
march2023 <- read_csv("csv/202303-divvy-tripdata.csv")
april2023 <- read_csv("csv/202304-divvy-tripdata.csv")
may2023 <- read_csv("csv/202305-divvy-tripdata.csv")


# Aggregating all data into single data frame
df_list = list(june2022,july2022,august2022,september2022,october2022,november2022,december2022,january2023,february2023,march2023,april2023,may2023)
all_trips <- df_list %>% reduce(left_join, by=colnames(june2022))

# Removing irrelevant columns from the data frame
colnames(all_trips)
all_trips_reduced <- all_trips %>% select(-c(start_lat,start_lng,end_lat,end_lng))

# Data frame inspection
str(all_trips_reduced)
head(all_trips_reduced)
unique(all_trips_reduced$member_casual)

# Adding additional columns with relevant information regarding the date and trip duration
all_trips_reduced$ride_length <- c(all_trips$ended_at - all_trips$started_at)
all_trips_reduced$ride_length <- as.numeric(all_trips$ride_length)
all_trips_reduced$day_of_week <- c(wday(all_trips$started_at, label = TRUE, week_start = 1, abbr = FALSE))

# Initial data cleaning and verification
all_trips_reduced <- all_trips_reduced %>% filter(ride_length > 60)
all_trips_reduced <- all_trips_reduced %>% filter(!ride_length > 86400)
all_trips_reduced <- unique(all_trips_reduced)
all_trips_v2 <- all_trips_reduced %>% drop_na(start_station_name) %>% drop_na(end_station_name)


