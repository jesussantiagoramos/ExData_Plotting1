# NOTE: Run the script once the data set is downloaded and unzipped in your working directory

# Read the data set
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

# Select data from the dates 2007-02-01 and 2007-02-02
data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]

# Convert Time variable to time class
time <- paste(data$Date, data$Time)
data$Time <- strptime(time, format = "%d/%m/%Y %H:%M:%S")

# Create histogram and save it to a PNG file
png("Plot1.png")
hist(data$Global_active_power, col = "red", bg = "transparent", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()