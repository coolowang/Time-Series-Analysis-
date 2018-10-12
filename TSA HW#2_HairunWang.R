#==================================== 
#Time Series Analysis and Forecasting
# HW #2
# Hairun (Helen) Wang
#====================================

# Set working directory 

setwd('~/Desktop')
library(fpp)

#============
#Question 1
#============
#Load the visitors.rda dataset, make a time plot of your data and describe the main features of the series.

# Load data
aust <- window(visitors, start = 1985)
aust

# Make a time plot 
autoplot(aust)
summary(aust)

# Summary: Based on the time series plot, there is a positive trend and some seasonalities.


#============ 
#Question 2
#=============

# What is the appropriate Holt-Winters method for this  data set (multiplicative / additive)? why?

# Multiplicative is the appropriate HW method for this data set because seasonal variation increases with the level of series
fit1 <- hw(aust, h = 24, seasonal = "multiplicative")


#============ 
#Question 3
#=============

#Use the hw() function to forecast the next 15 months using Holt-Winters’ methods. Experiment with the following methods

# Linear trend with additive seasonality
fit2 <- hw(aust, h = 15, seasonal = "additive")

# Linear trend with multiplicative seasonality
fit3 <- hw(aust, h = 15, seasonal = "multiplicative")

# Exponential trend with multiplicative seasonality without damping
fit4 <- hw(aust, h = 15, seasonal = "multiplicative", exponential = TRUE)

# Exponential trend with multiplicative seasonality and damping
fit5 <- hw(aust, h = 15, seasonal = "multiplicative", exponential = TRUE, damped = TRUE)

# Linear trend with multiplicative seasonality and damping
fit6 <- hw(aust, h = 15, seasonal = "multiplicative", damped = TRUE)

#============ 
#Question 4
#=============

# Use the accuracy() function to compare the Root-Mean-Square-Error (RMSE) values of the forecasts from the various methods. Which do you prefer and why?

accuracy(fit2) #RMSE = 18.01758
accuracy(fit3) #RMSE = 14.6622
accuracy(fit4) #RMSE = 14.62367
accuracy(fit5) #RMSE = 14.42116
accuracy(fit6) #RMSE = 14.41189


# The last model (linear trend with multiplicative seasonality and damping) has the smallest RMSE, 
# hence, I prefer using this one. 

#============ 
#Question 5
#=============

checkresiduals(fit6)
summary(fit6)
