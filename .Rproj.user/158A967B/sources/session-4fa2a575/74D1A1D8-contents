# Read the temperature data into a dataframe
df <- read.table("./data/RACMO_EH5temperature.txt", 
                 header = T)

# Convert the DTM column from text to proper date format
df$DTM <- as.Date(df$DTM)

# Fit a linear model to find the trend of temperature over time
trend <- lm(df$RACMO_EH5_T ~ df$DTM)

# Plot temperature values over time as a line chart
plot(df$DTM, 
     df$RACMO_EH5_T, 
     type = "l", 
     xlab = "time", 
     ylab = "temperature")

# Add the linear trend line to the plot in blue
abline(trend, 
       col = "blue")

# Print a statistical summary of the linear model
summary(trend)


# Summary

# TREND: The blue line shows a clear and consistent upward trend in
# temperature from 1961 to 2100, as projected by the RACMO/ECHAM5 model
# for a Czech catchment.

# Temperature is the primary driver behind the other changes observed. 
# Rising temperatures increase PET, intensify the water cycle, and amplify 
# runoff variability.