## prepare 
DataData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";") # 2075259  by 9
Dateformat <- as.Date(DataData[, 1], format = "%d/%m/%Y")   # format specifies the original format in the data # result looks like 2007-02-01,   
DataData$Date2 <- Dateformat
Datasub <- DataData[DataData$Date2 >= "2007-02-01" & DataData$Date2 <= "2007-02-02", ]  # 2880  by 10

## plot1
num <- as.numeric(as.character(Datasub$Global_active_power)) # factor to character to numeric
hist(num, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png, file = "plot1.png")
dev.off()