# Google Data Analytics Case Study: How Does a Bike Share Navigate Speedy Success?

## Introduction

This project was completed as part of an optional capstone project for the Google Data Analytics Professional Certificate on Coursera.
I took on the role of a junior data analyst working in the marketing analytics team at **Cyclistic**, a bike-sharing company based in Chicago. My main task was to understand how casual riders and annual members use Cyclistic's bikes differently. The insights would form the basis of a new marketing strategy to convert casual riders into annual members. I used R to clean the data and Tableau to visualise my findings.

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

The business task is to identify the differences in service usage between casual users and members, and to find a way to encourage casual users to subscribe to the service.

## About the data

The data used in this project consists of 12 months of cycling trip data downloaded from [here](https://divvy-tripdata.s3.amazonaws.com/index.html). The data was provided by Motivate International Inc. The datasets have been saved in their original form, broken down by month.

## Data cleaning

The data cleaning process was done entirely in R, with code available [here](https://github.com/tjglwcz/bike_data_case_study/blob/master/workbench.r).
The whole process consisted of: merging all downloaded files into a single data frame, data verification, removing invalid and duplicate data, creating helper columns such as defining the day of the week for each trip and calculating the trip length. After cleaning the data, I did a quick descriptive analysis before exporting the CSV file for further visualisation using Tableau.

## Analysis and visualisation

First, I decided to see how the average ride length differed between members and casual users.

![Average Ride Time by User Type: 21 minutes for casual users vs. 12 minutes for members](/img/Average%20Ride%20Time%20by%20User%20Type.png)

As the graph shows, casual users spend on average almost ten minutes longer on a single ride than members. 

Next, I wanted to see if there was any fluctuation in average ride time between the months of the year.

![Average Ride Time by Month: visible rise in Spring and Summer for both user categories](/img/Average%20Ride%20Time%20by%20Month.png)

The graph shows that both types of users take longer rides from March onwards. The trend does not change until July. The change in trip length is not as significant for members as it is for casual users.

The ride length data shows that members tend to take shorter rides throughout the year, averaging 12 minutes per ride. Casual users rent the bikes for 5-10 minutes longer than members.

After analysing the ride length data, I compared the usage patterns based on the number of rentals in certain time frames. First, the distribution of trips by month:

![Number of Rides by Month](/img/Number%20of%20Rides%20by%20Month.png)

The service is clearly more popular among members than casual users during autumn and winter. However, casual users rent almost as many bikes as members during the summer months. Overall, there is a visible pattern of members using the service all year round, with casual users more likely to rent bikes during the warmer months. Furthermore, taking into account the longer ride times for casual users, it can be assumed that casual users tend to use rental bikes as a form of leisure activity, whereas the usage patterns for members suggest a more balanced, utilitarian approach to rental bikes.

To further analyse the usage patterns, I compared the number of rides per day of the week and per hour:

![Number of Rides by Day of the week](/img/Number%20of%20Rides%20by%20Day%20of%20the%20week.png)
![Number of Rides by Hour](/img/Number%20of%20Rides%20by%20Hour.png)

As shown in the graphs, members use the service most during the working week, with two significant peaks in usage at 8am and 5pm, suggesting that the service is popular with workers as part of their daily commute. Casual users tend to use rental bikes most during the weekend (their usage even exceeds that of members on Saturday), with a peak at 5pm, which also supports the assumption that casual users rent the bikes for leisure purposes.

## Conclusion and recommendations

The trip data show two approaches to rental bikes between members and casual users. Casual users are most likely to rent a bike in the afternoon during the summer, suggesting that their main use of a rental bike is leisure-oriented. However, their rental times tend to be longer than those of members. Members tend to rent bikes for shorter trips, with peaks in the mornings and afternoons. Insights from the data suggest that this customer group uses the rental bikes as a means of transport to and from work. 

To maximise the conversion of casual users into annual members, the marketing team should conduct user research to confirm assumptions about their rental bike usage patterns. Advertising could focus on the use of the bikes as a daily commute to work in order to create use cases other than leisure for casual users. If there is a bike rental app, it could also measure the money spent on single rides or single day passes and compare the spend with the price of an annual membership to constantly inform the user if the annual pass is the more cost effective option for them.