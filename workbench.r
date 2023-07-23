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
all_trips <- bind_rows(list(june2022,july2022,august2022,september2022,october2022,november2022,december2022,january2023,february2023,march2023,april2023,may2023))

#Checking if aggregated data frame includes all 12 months  
min(all_trips$started_at)
max(all_trips$started_at)

# Removing irrelevant columns from the data frame
colnames(all_trips)
all_trips_reduced <- all_trips %>% select(-c(start_lat,start_lng,end_lat,end_lng))

# Data frame inspection
str(all_trips_reduced)
head(all_trips_reduced)
unique(all_trips_reduced$member_casual)

# Adding additional columns with relevant information regarding the date and trip duration
all_trips_reduced$ride_length <- c(all_trips_reduced$ended_at - all_trips$started_at)
all_trips_reduced$ride_length <- as.numeric(all_trips_reduced$ride_length)
all_trips_reduced$day_of_week <- c(wday(all_trips_reduced$started_at, label = TRUE, week_start = 1, abbr = FALSE))

# Data cleaning and verification
all_trips_reduced <- all_trips_reduced %>% filter(ride_length > 60)
all_trips_reduced <- all_trips_reduced %>% filter(!ride_length > 86400)
all_trips_reduced <- all_trips_reduced %>% drop_na(ride_id)
all_trips_reduced <- unique(all_trips_reduced)

# Descriptive analysis

# Checking information about length of the rides
summary(all_trips_reduced$ride_length)

# Comparing the ride lengths between members and casual users

aggregate(all_trips_reduced$ride_length ~ all_trips_reduced$member_casual, FUN = mean)
aggregate(all_trips_reduced$ride_length ~ all_trips_reduced$member_casual, FUN = median)
aggregate(all_trips_reduced$ride_length ~ all_trips_reduced$member_casual, FUN = max)
aggregate(all_trips_reduced$ride_length ~ all_trips_reduced$member_casual, FUN = min)

# Comparing the ride lengths by each day between members and casual users 

aggregate(all_trips_reduced$ride_length ~ all_trips_reduced$member_casual + all_trips_reduced$day_of_week, FUN = mean)

# Comparing the number of rides by each day between members and casual users

aggregate(all_trips_reduced$ride_id ~ all_trips_reduced$member_casual + all_trips_reduced$day_of_week, FUN = length)

# Comparing the number of rides by the vehicle type between members and casual users

aggregate(all_trips_reduced$ride_id ~ all_trips_reduced$member_casual + all_trips_reduced$rideable_type, FUN = length)

# Saving a clean CSV file for further visualization using Tableau

write.csv(all_trips_reduced, file = 'bike_sharing_data_clean.csv', row.names = FALSE)
