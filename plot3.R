data <- data.frame(read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = F))
data$Date <- paste(data$Date, data$Time)
data$Date <- as.POSIXct(strptime(data$Date, format = "%d/%m/%Y %H:%M:%S"))

Days <- seq.POSIXt(as.POSIXct("2007-02-01"),as.POSIXct("2007-02-03"),by="min")

selected <- data[data$Date %in% Days,]
selected[,3:9] <- as.numeric(unlist(selected[,3:9]))

png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(selected$Date, selected$Sub_metering_1, col = "black", type = "l", xlab = "", ylab ="Global Active Power (kilowatts)")
lines(selected$Date, selected$Sub_metering_2, col = "red")
lines(selected$Date, selected$Sub_metering_3, col = "blue")
legend("topright", pch = "-", legend = names(selected[7:9]), col = c("black","red","blue"))
locs <- which(format(selected$Date,format = "%H:%M:%S") == "00:00:00")
axis(1, at = locs, labels = format(selected$Date[locs], "%a"))
dev.off()