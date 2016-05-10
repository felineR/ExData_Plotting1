##Getting and subsetting the data set
power_consumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
power_consumption <- subset(power_consumption, (power_consumption$Date == "1/2/2007" | power_consumption$Date == "2/2/2007"))

##Plot 2
power_consumption$Global_active_power <- as.numeric(levels(power_consumption$Global_active_power))[power_consumption$Global_active_power]
power_consumption$Date <- as.Date(power_consumption$Date, format = "%d/%m/%Y")
power_consumption$DateTime <- as.POSIXct(strptime(paste(power_consumption$Date, power_consumption$Time),
                                                  format = "%Y-%m-%d %H:%M:%S"))
png(filename = "plot2.png", height = 480, width = 480)
plot(power_consumption$Global_active_power ~ power_consumption$DateTime, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()

rm(power_consumption)