vamsi <- read.csv("C:/Vamsi_Work/Data_analysis/household_power_consumption.txt",sep=';')
vamsi$Date <- as.Date(vamsi$Date, format="%d/%m/%Y")
vamsi_imp <- vamsi[(vamsi$Date=="2007-02-01") | (vamsi$Date=="2007-02-02"),]
vamsi_imp$Global_active_power  <- as.numeric(as.character(vamsi_imp$Global_active_power))
vamsi_imp$Sub_metering_1  <- as.numeric(as.character(vamsi_imp$Sub_metering_1))
vamsi_imp$Sub_metering_2  <- as.numeric(as.character(vamsi_imp$Sub_metering_2))
vamsi_imp$Sub_metering_3  <- as.numeric(as.character(vamsi_imp$Sub_metering_3))
vamsi_imp <- transform(vamsi_imp, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

par(mar=c(3.75,4,3,2))

plot(vamsi_imp$timestamp,vamsi_imp$Global_active_power,type="l",xlab="",ylab="Global Active Power")

plot(vamsi_imp$timestamp,vamsi_imp$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(vamsi_imp$timestamp,vamsi_imp$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(vamsi_imp$timestamp,vamsi_imp$Sub_metering_2,col="red")
lines(vamsi_imp$timestamp,vamsi_imp$Sub_metering_3,col="blue")
##legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

plot(vamsi_imp$timestamp,vamsi_imp$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()