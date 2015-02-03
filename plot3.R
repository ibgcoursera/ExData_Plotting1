# Plot 3

library(data.table)
data <- fread("household_power_consumption.txt",sep=";",header = TRUE, na.strings=c("?"),stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]
data$Time <- paste(data$Date,data$Time)
data[[2]] <- strptime(data$Time, format="%Y-%m-%d %H:%M:%S") 
plot(data$Time,data$Sub_metering_1, type = "l", xlab="",ylab="Energy sub metering")
lines(data$Time,data$Sub_metering_2,col="red")
lines(data$Time,data$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1))
dev.copy(png, file ="plot3.png", width=504, height=504,units="px")
dev.off() 