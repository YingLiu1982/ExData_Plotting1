data <- data.frame(read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = F))
data$Date <- paste(data$Date, data$Time)
data$Date <- as.POSIXct(strptime(data$Date, format = "%d/%m/%Y %H:%M:%S"))

Days <- seq.POSIXt(as.POSIXct("2007-02-01"),as.POSIXct("2007-02-03"),by="min")

selected <- data[data$Date %in% Days,]
selected[,3:9] <- as.numeric(unlist(selected[,3:9]))

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(selected$Global_active_power, col = "red", xlab="Global Active Power (kilowatts)", ylab ="Frequency", main = "Global Active Power")
dev.off()