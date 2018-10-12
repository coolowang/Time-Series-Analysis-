# Time-Series-Analysis-

* For this exercise, we will use the Quarterly US GDP 1947Q1 – 2006Q1 dataset from FPP package. (Data set: usgdp.rda). 

Question 1: Load the usgdp.rda dataset and split it into a training dataset (1947Q1 - 2005Q1) and a test dataset (2005Q2 - 2006Q1) 

Question 2: Plot the training dataset. Is Box-Cox transformation necessary for this data? 

Question 3: Plot the 1st and 2nd order difference of the data. Apply KPSS Test for Stationarity to determine which difference order results in a stationary dataset. 

Question 4: Fit a suitable ARIMA model to the transformed data using the auto.arima() function. Report the resulting 𝑝, 𝑑, 𝑞 and the coefficients values.

Question 5: Compute the sample Extended ACF (EACF) and use the Arima() function to try some other plausible models by experimenting with the orders chosen. Limit your models to 𝑞, 𝑝 ≤ 2 and 𝑑 ≤ 2. Use the model summary() function to compare the Corrected Akaike information criterion (i.e., AICc) values (Note: Smaller values indicated better models). 
