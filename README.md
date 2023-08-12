# Google Data Analytics Case Study: How Does a Bike Share Navigate Speedy Success?

## Introduction

This project was made as a part of an optional Capstone Project in the Google Data Analytics Professional Certificate on Coursera.
I took the role of a junior data analyst working in the marketing analyst team at **Cyclistic**, a bike sharing company from Chicago. My main task was to understand how casual riders and annual members use Cyclistic bikes differently. The insights are going to be the base for a new marketing strategy to convert casual riders into annual members. I used R for data cleaning, and visualized my findings using Tableau.

## About the company

In 2016, Cyclistic launched a successful bike-share oﬀering. Since then, the program has grown to a ﬂeet of 5,824 bicycles that
are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and
returned to any other station in the system anytime.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments.
One approach that helped make these things possible was the ﬂexibility of its pricing plans: single-ride passes, full-day passes,
and annual memberships. Customers who purchase single-ride or full-day passes are referred to as **casual riders**. Customers
who purchase annual memberships are **Cyclistic members**.

Cyclistic’s ﬁnance analysts have concluded that **annual members are much more proﬁtable than casual riders**. Although the
pricing ﬂexibility helps Cyclistic attract more customers, the marketing director believes that maximizing the number of annual members will
be key to future growth.

The marketing director has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to
do that, however, the marketing analyst team needs to better understand how annual members and casual riders diﬀer, why
casual riders would buy a membership, and how digital media could aﬀect their marketing tactics.

## Business task

The business is to determine the differences in service usage between casual users and members, and to find a way to encourage the casual users to subscribe to the service.

## About the data

The data used in this project consist of 12 months of Cyclistic trip data downloaded from [here](https://divvy-tripdata.s3.amazonaws.com/index.html). The data has been made available by Motivate International Inc. The datasets were stored in the original form, divided by month.

## Data cleaning

The data cleaning process was fully done using R, with the code available [here](https://github.com/tjglwcz/bike_data_case_study/blob/master/workbench.r).
The whole process consisted of: aggregating all downloaded files into a single data frame, data verification, removing invalid and duplicate data, creating helper columns, such as defining the day of the week for every ride and calculating the ride length. After data cleaning, I have conducted a quick descriptive analysis, before exporting the CSV file for further visualization using Tableau.

## Analysis and visualization

First, I have decided to see how does the average ride length differ between members and casual users.

![Average Ride Time by User Type: 21 minutes for casual users vs. 12 minutes for members](/img/Average%20Ride%20Time%20by%20User%20Type.png)

As the graph presents, casual users on average spend almost ten minutes longer on a singular ride comparing to members. 

Next, I wanted to see any fluctuations in the average ride time between the months of the year.

![Average Ride Time by Month: visible rise in Spring and Summer for both user categories](/img/Average%20Ride%20Time%20by%20Month.png)

Based on the graph, both user types take longer rides starting from March, and the trend does not change until July. The change in ride lenghts is not as significant for members, as it is for casual users.

The ride length data shows us that members tend to choose shorter ride for the entire year, averaging in 12 minutes per trip. Casual users rent the bikes for trips longer by 5 - 10 minutes comparing to members.

After analyzing the ride length data, I compared the use patterns based on the number of rentals in certain time frames. First, the ride distribution based on the month:

![Number of Rides by Month](/img/Number%20of%20Rides%20by%20Month.png)

The service is visibly more popular among the members comparing to casual users during Autumn and Winter. However, casual users rent almost as much bikes as members during the Summer months. Overall, there is a visible patter for members to use the service all year round, where the casual users tend to rent bikes mostly during warmer months. In addition, taking the longer ride times for casual users into consideration, it is possible to assume that casual users tend to use rented bikes as a form of past-time activity, where the usage patterns for members imply a more balanced, utilitarian approach for rental bikes.

To further analyze the usage patterns, I have compared the number of rides based on the day of the week and hour:

![Number of Rides by Day of the week](/img/Number%20of%20Rides%20by%20Day%20of%20the%20week.png)
![Number of Rides by Hour](/img/Number%20of%20Rides%20by%20Hour.png)

As presented on the graphs, members use the service the most during the work week with two significant peaks in usage around 8 AM and 5 PM, which indicates popularity of the service among workers as a part of daily commute to and from work. Casual users tend to use rental bikes the most during the weekend (their usage even surpasses member's on Saturday), with one peak at 5 PM, which also further confirms the assumption of casual users renting the bikes for leisure purposes.

## Conclusion and recommendations

The ride data presents two approaches to rental bikes between members and casual users. The casual users are most likely to rent a bike during summer in the afternoon, which indicates that their main use for rental bike is leisure oriented. However, their rent times tend to be longer comparing to members. Members are mostly renting the bikes for shorter trips, with main peaks in the morning and in the afternoon. Insights from the data suggest that this customer group uses rental bikes as a mean of transport to and from work. 

To maximize user conversions into annual members, the marketing team should conduct user research to confirm the assumptions about their rental bike usage patterns. The advertisements could focus on using the bikes as a daily commute to work, to create other use cases apart from leisure for the casual users. If there is an app used for bike rentals, it could also measure money spent on single ride or single day passes and compare the spending to the price of annual membership, to constantly notify the user if they annual pass is the more cost-friendly option for them.