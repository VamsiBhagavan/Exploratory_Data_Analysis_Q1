vamsi <- read.csv("C:/Vamsi_Work/Data_analysis/household_power_consumption.txt",sep=';')
vamsi$Date <- as.Date(vamsi$Date, format="%d/%m/%Y")
vamsi_imp <- vamsi[(vamsi$Date=="2007-02-01") | (vamsi$Date=="2007-02-02"),]
vamsi_imp$Global_active_power  <- as.numeric(as.character(vamsi_imp$Global_active_power))
hist(vamsi_imp$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()