# Load the data from file to a data frame
power <- read.table("household_power_consumption.txt", header=T, sep=";",na.strings = "?")

# Create a new column DateTime which is in Posix date format
power$DateTime <- strptime(paste(power$Date,power$Time),"%d/%m/%Y %H:%M:%S")

# Filter out the data for 1 Feb 2007 and 2 Feb 2007
power <- power[power$DateTime < "2007-02-03" & power$DateTime > "2007-02-01",]

# plot the required graphs
plot(power$DateTime,power$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
points(power$DateTime,power$Sub_metering_2,type = "l",col = "red")
points(power$DateTime,power$Sub_metering_3,type = "l",col = "blue")
legend("topright",lty = 1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Copy figure to png device
dev.copy(png,"plot3.png")
# Close the png device
dev.off()