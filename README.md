# Time-Series-Analysis-



# Assignment 2
For this exercise, use the monthly Australian short-term overseas visitors data, May 1985–April 2005 which is also available in the ‘expsmooth’ library (Data set: visitors.).

*Question 1:
Load the visitors.rda dataset, make a time plot of your data and describe the main features of the series.

*Question 2:
What is the appropriate Holt-Winters method for this data set (multiplicative / additive)? why?

*Question 3
Use the hw() function to forecast the next 15 months using Holt-Winters’ methods. Experiment with the following methods
• Linear trend with additive seasonality
• Linear trend with multiplicative seasonality
• Exponential trend with multiplicative seasonality without damping
• Exponential trend with multiplicative seasonality and damping
• Linear trend with multiplicative seasonality and damping

*Question 4:
Use the accuracy() function to compare the Root-Mean-Square-Error (RMSE) values of the forecasts from the various methods. Which do you prefer and why?


*Question 5:
Use the checkresiduals() function to check that the residuals from the best model look like white noise and provide a summary of the model’s smoothing parameters using the summary() function.



# Assignment 3
For this exercise, we will use the Quarterly US GDP 1947Q1 – 2006Q1 dataset from FPP package. (Data set: usgdp.rda). 

*Question 1: Load the usgdp.rda dataset and split it into a training dataset (1947Q1 - 2005Q1) and a test dataset (2005Q2 - 2006Q1) 

*Question 2: Plot the training dataset. Is Box-Cox transformation necessary for this data? 

*Question 3: Plot the 1st and 2nd order difference of the data. Apply KPSS Test for Stationarity to determine which difference order results in a stationary dataset. 

*Question 4: Fit a suitable ARIMA model to the transformed data using the auto.arima() function. Report the resulting 𝑝, 𝑑, 𝑞 and the coefficients values.

*Question 5: Compute the sample Extended ACF (EACF) and use the Arima() function to try some other plausible models by experimenting with the orders chosen. Limit your models to 𝑞, 𝑝 ≤ 2 and 𝑑 ≤ 2. Use the model summary() function to compare the Corrected Akaike information criterion (i.e., AICc) values (Note: Smaller values indicated better models). 
