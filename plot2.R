# Plot 2

library(data.table)
data <- fread("household_power_consumption.txt",sep=";",header = TRUE, na.strings=c("?"),stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]
data$Time <- paste(data$Date,data$Time)
data[[2]] <- strptime(data$Time, format="%Y-%m-%d %H:%M:%S") 
plot(data$Time, data$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file ="plot2.png", width=504, height=504,units="px")
dev.off() 