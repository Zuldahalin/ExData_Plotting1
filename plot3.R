##Exploratory Data Analysis - Assignment 3
##Read the data from the "household_power_consumption.txt" from the course website
##https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##Select dates between 1/2/2007 and 2/2/2007
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep = ';', na.strings = "?")
names(dat) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
dat$Time  <- paste(dat$Date, dat$Time)
dat$Time <- strptime(dat$Time, "%d/%m/%Y %H:%M:%S")##convert to date/time POSIXct
##plot the graph
x <- dat$Sub_metering_1
y <- dat$Sub_metering_2
z <- dat$Sub_metering_3
png(file = "plot3.png")
plot(dat$Time, x, type = "n", xlab = "", ylab = "Energy Sub Metering")##prepare for plot
points(dat$Time, x, type = "l", lty = 1, col = "black")
points(dat$Time, y, type = "l", lty = 1, col = "red")
points(dat$Time, z, type = "l", lty = 1, col = "blue")
legend("topright",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1)
##dev.copy(png, file = "plot3.png", width=480, height=480)## copy line graph to plot3.png

dev.off()
