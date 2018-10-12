graphics.off()
library(fpp)
library(TSA)


# Box-Cox Exmaple: Monthly anti-diabetic drug sales in Australia from 1992 to 2008 Time-series ----
# Plot the Time-series

win.graph(width=12, height=6,pointsize=12)
autoplot(a10)

# Try four values of lambda in Box-Cox transformations
a10 %>% BoxCox(lambda = .1) %>% autoplot()
a10 %>% BoxCox(lambda = 0.2) %>% autoplot()
a10 %>% BoxCox(lambda = 0.3) %>% autoplot()
a10 %>% BoxCox(lambda = 0) %>% autoplot()

# Compare with BoxCox.lambda()
BoxCox.lambda(a10)


### arima.sim() Example: Simulate  an ARIMA Model ###  ----
graphics.off()

?arima.sim

# Pure AR(2)
win.graph(width=12, height=6,pointsize=12)
AR2 <- arima.sim(n = 150, list(order=c(2,0,0), ar=c(0.8, -0.4) ))
tsdisplay(AR2)

# Pure MA(1)
win.graph(width=12, height=6,pointsize=12)
MA1 <- arima.sim(n = 150, list(order=c(0,0,1), ma=c(0.9) ))
tsdisplay(MA1)


# ARMA(2,1)
win.graph(width=12, height=6,pointsize=12)
ARMA21 <- arima.sim(n = 150, list(order=c(2,0,1), ar =c(0.8, -0.4) ,ma=c(0.8897) ))
tsdisplay(ARMA21)

# AR + Mean to AR 
win.graph(width=12, height=6,pointsize=12)
AR2mean <- arima.sim(n = 150, list(order=c(2,0,0), ar =c(0.8, -0.4) )) + 10
mean(AR2mean) # ~=10
tsdisplay(AR2mean)

# AR + Mean to AR 
win.graph(width=12, height=6,pointsize=12)
AR2_er <- arima.sim(n = 150, list(order=c(2,0,0), ar =c(0.8, -0.4) ), mean=10) 
mean(AR2_er) ## =16.63957 ==> not equal to 10 ==> 10/(1-0.8+0.4)
tsdisplay(AR2_er)


### auto.arima() Example: Fit best ARIMA model to univariate time series ### ----
graphics.off()

?auto.arima
?usconsumption # Growth rates of personal consumption and personal income in the USA.
data1 <- usconsumption[,1]

win.graph(width=12, height=6,pointsize=12)
tsdisplay(data1,main= "US consumption")

fit <- auto.arima(data1,seasonal=FALSE)
fit # ARIMA(0,0,3) with non-zero mean

?eacf
eacf(data1)
win.graph(width=12, height=6,pointsize=12)
plot(forecast(fit,h=10),include=100)

#### Arima() Example: Choosing your own model  ####
# Load Help document
?Arima

# Note: Largely a wrapper for the arima function in the stats package. 
# The main difference is that this function allows a drift term
Arima(data1, order=c(0,0,3)) # The same as auto.arima
Arima(data1, order=c(2,1,3)) # The same as auto.arima


#### ARIMA Example #### -----
graphics.off()
win.graph(width=12, height=6,pointsize=12)
?elecequip # Electrical equipment manufactured in the Euro area.
tsdisplay(elecequip,main= "electrical equipment")
# Note 1: The data are clearly non-stationary 

# Seasonally adjusted electrical equipment
graphics.off()
eeadj <- seasadj(stl(elecequip, s.window="periodic"))

win.graph(width=12, height=6,pointsize=12)
tsdisplay(eeadj,main= "Seasonally adjusted electrical equipment") 
win.graph(width=12, height=6,pointsize=12)
tsdisplay(diff(eeadj), main = "Diff Seasonally adjusted electrical equipment") 
# Note: The PACF  is suggestive of an AR(3) model

win.graph(width=12, height=6,pointsize=12)
fit <- auto.arima(eeadj,seasonal=FALSE)
fit # ARIMA(3,1,1) with non-zero mean
plot(forecast(fit,h=50))


eacf(diff(eeadj))

# Try some models
Arima(eeadj,c(3,1,0))
Arima(eeadj,c(3,1,1))
Arima(eeadj,c(4,1,0))
Arima(eeadj,c(2,1,0))