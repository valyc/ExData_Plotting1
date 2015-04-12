# Read dta from txt file
household_power_consumption <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, stringsAsFactors=FALSE, na.strings="?")
# Convert the Date variable to Date class
household_power_consumption[, "Date"] <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")
# Setting data for 1 and 2 Jan 2007
data_1_2_02_2007 <- subset(household_power_consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
# Create a new Date&Time variable
datetime <- paste(as.Date(data_1_2_02_2007$Date), data_1_2_02_2007$Time)
data_1_2_02_2007$Datetime <- as.POSIXct(datetime)

# plot 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma=c(0,0,2,0))
with(data_1_2_02_2007, {
  plot(Global_active_power~Datetime, type = "l", xlab = "", ylab = "Global Active Power")
  plot(Voltage~Datetime, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(Datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(Sub_metering_2~Datetime, col = "red")
  lines(Sub_metering_3~Datetime, col = "blue")
  legend("topright", bty = "n", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()