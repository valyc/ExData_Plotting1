# Read data from txt file
household_power_consumption <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, stringsAsFactors=FALSE, na.strings="?")
# Convert the Date variable to Date class
household_power_consumption[, "Date"] <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")
# Setting data for 1 and 2 Feb 2007
data_1_2_02_2007 <- subset(household_power_consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
# Create a new Date&Time variable
datetime <- paste(as.Date(data_1_2_02_2007$Date), data_1_2_02_2007$Time)
data_1_2_02_2007$Datetime <- as.POSIXct(datetime)

# plot 1
globalActivePower <- as.numeric(data_1_2_02_2007$Global_active_power)
png("plot1.png", height=480, width=480)
hist(globalActivePower, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()