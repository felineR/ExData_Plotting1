##Getting and subsetting the data set
power_consumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
power_consumption <- subset(power_consumption, (power_consumption$Date == "1/2/2007" | power_consumption$Date == "2/2/2007"))

##Data Cleaning
power_consumption$Global_active_power <- as.numeric(levels(power_consumption$Global_active_power))[power_consumption$Global_active_power]
power_consumption$Global_reactive_power <- as.numeric(levels(power_consumption$Global_reactive_power))[power_consumption$Global_reactive_power]
power_consumption$Voltage <- as.numeric(levels(power_consumption$Voltage))[power_consumption$Voltage]
power_consumption$Date <- as.Date(power_consumption$Date, format = "%d/%m/%Y")
power_consumption$DateTime <- as.POSIXct(strptime(paste(power_consumption$Date, power_consumption$Time),
                                                  format = "%Y-%m-%d %H:%M:%S"))
power_consumption$Sub_metering_1 <- as.numeric(levels(power_consumption$Sub_metering_1))[power_consumption$Sub_metering_1]
power_consumption$Sub_metering_2 <- as.numeric(levels(power_consumption$Sub_metering_2))[power_consumption$Sub_metering_2]

##Plot 4
png(filename = "plot4.png", height = 480, width = 480)
par(mfrow = c(2,2), mar = c(4,4,4,4))

#Plot topleft
plot(power_consumption$Global_active_power ~ power_consumption$DateTime, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

#Plot topright
plot(power_consumption$Voltage ~ power_consumption$DateTime, 
     type = "l", 
     xlab = "datetime",
     ylab = "Voltage")

#Plot bottomleft
plot(power_consumption$Sub_metering_1 ~ power_consumption$DateTime, type = "n",
     ylab = "Energy sub metering", xlab = "")
points(power_consumption$Sub_metering_1 ~ power_consumption$DateTime, col = "black", type = "l")
points(power_consumption$Sub_metering_2 ~ power_consumption$DateTime, col = "red", type = "l")
points(power_consumption$Sub_metering_3 ~ power_consumption$DateTime, col = "blue", type = "l")
legend("topright", legend = names(power_consumption[7:9]), cex = 0.75,
       lwd = 1, lty = 1, col = c("black", "red", "blue"))

##Plot bottomright
plot(power_consumption$Global_reactive_power ~ power_consumption$DateTime, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

rm(power_consumption)