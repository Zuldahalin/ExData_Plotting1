##Exploratory Data Analysis - Assignment 1
##Read the data from the "household_power_consumption.txt" from the course website
##https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##Select dates between 1/2/2007 and 2/2/2007
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep = ';', na.strings = "?")
names(dat) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
##plot the histogram
with(dat, hist(Global_active_power, main = "Global Active Power", ylim = c(0,1200), xlab = "Global Active Power (kilowatts)", col = "red"))
dev.copy(png, file = "plot1.png")## copy histogram to plot1.png
dev_off()