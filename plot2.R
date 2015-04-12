vamsi <- read.csv("C:/Vamsi_Work/Data_analysis/household_power_consumption.txt",sep=';')
vamsi$Date <- as.Date(vamsi$Date, format="%d/%m/%Y")
vamsi_imp <- vamsi[(vamsi$Date=="2007-02-01") | (vamsi$Date=="2007-02-02"),]
vamsi_imp$Global_active_power  <- as.numeric(as.character(vamsi_imp$Global_active_power))
vamsi_imp <- transform(vamsi_imp, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
plot(vamsi_imp$timestamp,vamsi_imp$Global_active_power,type="l",xlab="",ylab="Global_active_power(kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()