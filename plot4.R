## prepare 
DataData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";") # 2075259  by 9
Dateformat <- as.Date(DataData[, 1], format = "%d/%m/%Y")   # format specifies the original format in the data # result looks like 2007-02-01,   
DataData$Date2 <- Dateformat
Datasub <- DataData[DataData$Date2 >= "2007-02-01" & DataData$Date2 <= "2007-02-02", ]  # 2880  by 10

## plot4
dates <- as.character(Datasub[, 1]) # factor to character
times <- as.character(Datasub[, 2])
x <- paste(dates, times)
DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")  # note it is Y not y

num <- as.numeric(as.character(Datasub$Global_active_power))
num2 <- as.numeric(as.character(Datasub$Voltage))
num3 <- as.numeric(as.character(Datasub$Global_reactive_power))
par(mfrow = c(2,2))
plot(DateTime, num, type = "l", xlab = "", ylab = "Global Active Power")
plot(DateTime, num2, type = "l", xlab = "datatime", ylab = "Voltage")
plot(DateTime, Datasub[, 7], type = "l", col = "black", ylab = "Energy sub metering", xlab = "", yaxt = "n") # leave ticks on y axis empty 
lines(DateTime, Datasub[, 8], type = "l", col = "red")  # add 2nd variable 
lines(DateTime, Datasub[, 9], type = "l", col = "blue") # add 3rd variable 
legend("topright", pch = NA, lwd = 1, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(side = 2, at = c(0, 10, 20, 30)) 
plot(DateTime, num3, type = "l", xlab = "datatime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off()