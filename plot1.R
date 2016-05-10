##Getting and subsetting the data set
power_consumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
power_consumption <- subset(power_consumption, (power_consumption$Date == "1/2/2007" | power_consumption$Date == "2/2/2007"))

##Plot 1
power_consumption$Global_active_power <- as.numeric(levels(power_consumption$Global_active_power))[power_consumption$Global_active_power]
png(filename = "plot1.png", height = 480, width = 480)
hist(power_consumption$Global_active_power,
     col = "red", 
     main = "Power Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()

rm(power_consumption)