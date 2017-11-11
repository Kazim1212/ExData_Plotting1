#Loading the data into variable called raw_data

file_name <- "household_power_consumption.txt"
raw_data <- read.table(file_name, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#Extracting only data from 2007-02-01 and 2007-02-02 only

new_data <- raw_data[raw_data$Date %in% c("1/2/2007", "2/2/2007") ,]

#Preparing for ploting the data
globalActivePower <- as.numeric(new_data$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(globalActivePower, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = 'red')
dev.off()

