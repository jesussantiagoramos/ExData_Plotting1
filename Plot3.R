# NOTE: Run the script once the data set is downloaded and unzipped in your working directory

# Set English as time setting language
Sys.setlocale("LC_TIME", "English")

# Read the data set
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

# Select data from the dates 2007-02-01 and 2007-02-02
data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]

# Convert Time variable to time class
time <- paste(data$Date, data$Time)
data$Time <- strptime(time, format = "%d/%m/%Y %H:%M:%S")

# Create third plot and save it to a PNG file
png("Plot3.png")
plot(data$Time, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type="n", bg = "transparent")
lines(data$Time, data$Sub_metering_1)
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", pch = "_", col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
dev.off()