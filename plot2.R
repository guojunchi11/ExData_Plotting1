## prepare 
DataData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";") # 2075259  by 9
Dateformat <- as.Date(DataData[, 1], format = "%d/%m/%Y")   # format specifies the original format in the data # result looks like 2007-02-01,   
DataData$Date2 <- Dateformat
Datasub <- DataData[DataData$Date2 >= "2007-02-01" & DataData$Date2 <= "2007-02-02", ]  # 2880  by 10

## plot2
dates <- as.character(Datasub[, 1]) # factor to character
times <- as.character(Datasub[, 2])
x <- paste(dates, times)
DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")  # note it is Y not y
num <- as.numeric(as.character(Datasub$Global_active_power)) # factor to character to numeric

plot(DateTime , num, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png")
dev.off()