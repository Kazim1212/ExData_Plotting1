#Loading the data into variable called raw_data

file_name <- "household_power_consumption.txt"
raw_data <- read.table(file_name, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#Extracting only data from 2007-02-01 and 2007-02-02 only

new_data <- raw_data[raw_data$Date %in% c("1/2/2007", "2/2/2007") ,]

#Preparing the variables for ploting the data
date_time <- strptime(paste(new_data$Date, new_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(new_data$Global_active_power)
globalReactivepower <- as.numeric(new_data$Global_reactive_power)
voltage <- as.numeric(new_data$Voltage)
subMetering1 <- as.numeric(new_data$Sub_metering_1)
subMetering2 <- as.numeric(new_data$Sub_metering_2)
subMetering3 <- as.numeric(new_data$Sub_metering_3)

#Preparing the output device
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

#Ploting the required graphs
plot(date_time, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)
plot(date_time, voltage, type = "l", xlab = "Date & Time", ylab = "Voltage")
plot(date_time, subMetering1, type = "l", ylab = "Energy Sub Metering", xlab = "")

#Defining the Lines and Lengend
lines(date_time, subMetering2, type="l", col="red")
lines(date_time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(date_time, globalReactivepower, type = "l", xlab = "Date & Time", ylab = "Global Reactive Power")

dev.off()