##Exploratory Data Analysis - Assignment 2
##Read the data from the "household_power_consumption.txt" from the course website
##https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##Select dates between 1/2/2007 and 2/2/2007
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep = ';', na.strings = "?")
names(dat) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
dat$Time  <- paste(dat$Date, dat$Time)
dat$Time <- strptime(dat$Time, "%d/%m/%Y %H:%M:%S")##convert to date/time POSIXct
##plot the graph
with(dat, {
     plot(dat$Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", lty = 1)
})
  dev.copy(png, file = "plot2.png", width=480, height=480)## copy line graph to plot2.png
dev.off()
