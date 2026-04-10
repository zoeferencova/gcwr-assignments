# Load required packages
library(data.table)
library(ggplot2)

# Read the runoff data into a data table
dt <- fread("./data/RACMO_EH5_Runoff.txt")

# Rename the runoff column to something cleaner
setnames(dt, 
         old = c("RACMO_EH5_RM"), 
         new = c("Runoff"))

# Label each row with its 30-year period
dt[year(DTM) %in% c(1961:1990), period := "1961-1990"]
dt[year(DTM) %in% c(2021:2050), period := "2021-2050"]
dt[year(DTM) %in% c(2071:2100), period := "2071-2100"]

# Remove rows not assigned to any period
dt <- na.omit(dt)

# Create a boxplot of runoff for each period
fig <- ggplot(dt, 
              aes(x = period, y = Runoff)) + 
  geom_boxplot()

fig

# Calculate standard deviation of runoff for each period
stan_dev <- dt[, round(sd(Runoff), 2), by = period]
names(stan_dev) <- c("period", "sd_of_Runoff")

stan_dev

# Calculate mean runoff for each period
averages <- dt[, round(mean(Runoff), 2), 
               by = period]

names(averages) <- c("period", "mean_of_Runoff")

averages


# Summary

# STANDARD DEVIATION: SD rises from 7.81 (1961-1990) to 14.19 (2071-2100),
# roughly an 82% increase. Compare this to precipitation SD which rose
# only ~22% over the same period. Runoff variability amplifies the
# precipitation signal considerably.

# MEAN: Mean runoff rises from 7.37 to 11.64 mm — a 58% increase. This
# suggests not just more variable runoff but more runoff overall by end
# of century, likely linked to increased precipitation in that period.

# WATER CYCLE AMPLIFICATION (key concept): A warmer atmosphere holds more 
# moisture. More moisture means more intense precipitation events
# when it does rain, and longer dry spells in between. Runoff responds to
# this non-linearly — soils saturate faster during intense events (more
# runoff) and dry out more during dry spells (less runoff). The result is
# that runoff variability increases faster than precipitation variability,
# amplifying the water cycle extremes already present in the climate signal.