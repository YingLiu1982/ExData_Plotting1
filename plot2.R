data <- data.frame(read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = F))
data$Date <- paste(data$Date, data$Time)
data$Date <- as.POSIXct(strptime(data$Date, format = "%d/%m/%Y %H:%M:%S"))

Days <- seq.POSIXt(as.POSIXct("2007-02-01"),as.POSIXct("2007-02-03"),by="min")

selected <- data[data$Date %in% Days,]
selected[,3:9] <- as.numeric(unlist(selected[,3:9]))

png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(selected$Global_active_power, type = "l", xaxt = "n", xlab = "", ylab ="Global Active Power (kilowatts)")
locs <- which(format(selected$Date,format = "%H:%M:%S") == "00:00:00")
axis(1, at = locs, labels = format(selected$Date[locs], "%a")  )
dev.off()