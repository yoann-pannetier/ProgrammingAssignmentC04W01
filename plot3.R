library("data.table")

setwd("C:/Users/yoann/Documents/GitHub/ProgrammingAssignmentC04W01/exdata_data_household_power_consumption")

# Load data from source file into R object "DataSource"
DataSource <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "NA", 
                         stringsAsFactors = FALSE)

# Add a new column DateTime for converted date and time in a format ready for calculations
DateTime <- strptime(paste(DataSource$Date, DataSource$Time), format = "%d/%m/%Y %H:%M:%S")
DataSource <- cbind(DateTime, DataSource)

# Filter DateTime for 2007-02-01 and 2007-02-02
DataSource <- subset(DataSource, DataSource$DateTime >= "2007-02-01" & DataSource$DateTime < "2007-02-03")

# Convert Global_active_power in numeric format for plot
DataSource$Global_active_power <- as.numeric(DataSource$Global_active_power)

# Set plot device
png("plot3.png", width=480, height=480)

# Plot 3
plot(DataSource$DateTime, DataSource$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(DataSource$DateTime, DataSource$Sub_metering_2, col = "red")
lines(DataSource$DateTime, DataSource$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1), lwd = c(1, 1))


dev.off()