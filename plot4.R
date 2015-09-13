##Exploratory Data Analysis - Assignment 1: Plot 4
##Read the data from the "household_power_consumption.txt" from the course website
##https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##Select dates between 1/2/2007 and 2/2/2007
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep = ';', na.strings = "?")
names(dat) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
dat$Time  <- paste(dat$Date, dat$Time)
dat$Time <- strptime(dat$Time, "%d/%m/%Y %H:%M:%S")##convert to date/time POSIXct
x <- dat$Sub_metering_1
y <- dat$Sub_metering_2
z <- dat$Sub_metering_3
##Set multiple base plot 2 rows 2 columns
png(filename = "plot4.png")##open png device for printing
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
##plot the graph
with(dat, {
  plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", lty = 1)
  plot(Time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage", lty = 1)
  plot(Time, x, type = "n", xlab = "", ylab = "Energy Sub Metering")##prepare for plot
  legend("topright",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, box.lwd = 0.5, cex = 0.5)
  points(Time, x, type = "l", lty = 1, col = "black")
  points(Time, y, type = "l", lty = 1, col = "red")
  points(Time, z, type = "l", lty = 1, col = "blue")
##  legend("topright",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1)
  plot(Time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", lty = 1)
})

##dev.copy(png, file = "plot4.png", width=480, height=480)## copy  to plot4.png
dev.off()
