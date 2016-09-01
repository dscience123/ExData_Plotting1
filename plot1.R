
# Load the data from file to a data frame
power <- read.table("household_power_consumption.txt", header=T, sep=";",na.strings = "?")

# Create a new column DateTime which is in Posix date format
power$DateTime <- strptime(paste(power$Date,power$Time),"%d/%m/%Y %H:%M:%S")

# Filter out the data for 1 Feb 2007 and 2 Feb 2007
power <- power[power$DateTime < "2007-02-03" & power$DateTime > "2007-02-01",]

# Draw the histogram for Glbal Active power
hist(power$Global_active_power, main = "Global Active Power", ylab = "Frequency",
     xlab = "Global Active Power (kilowatts)", col = "red", breaks = 13,
     ylim = c(0,1200), xlim = c(0, 6),xaxp=c(0,6,3))

# copy figure to png file
dev.copy(png,"plot1.png")

# close the png device
dev.off()