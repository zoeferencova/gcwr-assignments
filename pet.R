# Read the data file into a dataframe
df <- read.table("./data/RACMO_EH5_PET.txt", header=T)

# Convert the DTM column from text to proper date format
df$DTM <- as.Date(df$DTM)

# Fit a linear model to find the trend of PET over time
PET_trend <- lm(df$RACMO_EH5_PET ~ df$DTM)

# Plot PET values over time as a line chart
plot(df$DTM, df$RACMO_EH5_PET, type="l", xlab="time", ylab="PET")

# Add the linear trend line to the plot in green
abline(PET_trend, col="green")

# Print a statistical summary of the linear model
summary(PET_trend)


# TREND: The green line shows a slight but consistent upward trend in PET
# from 1961 to 2100, consistent with rising temperatures over time.

# RESIDUALS: The residuals range from -58.07 to +97.46, with a median of
# -11.93. The rough symmetry around zero suggests the linear model
# reasonably captures the central trend despite large seasonal swings.

# SLOPE: The DTM coefficient (2.116e-04) is positive, confirming PET
# increases over time. The value is small because DTM is measured in days.

# SIGNIFICANCE: The p-value for DTM is 0.0028, well below 0.05, meaning
# the upward trend in PET is statistically significant — very unlikely
# to be due to random chance.

# R-SQUARED: At 0.005, time explains only 0.5% of the total variation in
# PET. This is expected — the dominant source of variation is the seasonal
# cycle (summer PET is ~25x higher than winter), which the linear model
# does not capture. The trend is real but subtle relative to that noise.

# F-STATISTIC: p-value of 0.0028 confirms the overall model is
# statistically significant.