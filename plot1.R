# Plot 1

library(data.table)
data <- fread("household_power_consumption.txt",sep=";",header = TRUE, na.strings=c("?"),stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]
data$Global_active_power <- as.numeric(data$Global_active_power)
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.copy(png, file ="plot1.png", width=504, height=504,units="px")
dev.off() 