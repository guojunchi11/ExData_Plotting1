## prepare 
DataData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";") # 2075259  by 9
Dateformat <- as.Date(DataData[, 1], format = "%d/%m/%Y")   # format specifies the original format in the data # result looks like 2007-02-01,   
DataData$Date2 <- Dateformat
Datasub <- DataData[DataData$Date2 >= "2007-02-01" & DataData$Date2 <= "2007-02-02", ]  # 2880  by 10

## plot3
dates <- as.character(Datasub[, 1]) # factor to character
times <- as.character(Datasub[, 2])
x <- paste(dates, times)
DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")  # note it is Y not y

plot(DateTime, Datasub[, 7], type = "l", col = "black", ylab = "Energy sub metering", xlab = "", yaxt = "n") # leave ticks on y axis empty 
lines(DateTime, Datasub[, 8], type = "l", col = "red")  # add 2nd variable 
lines(DateTime, Datasub[, 9], type = "l", col = "blue") # add 3rd variable 
legend("topright", pch = NA, lwd = 1, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(side = 2, at = c(0, 10, 20, 30)) # specify ticks on y axis 

dev.copy(png, file = "plot3.png")
dev.off()