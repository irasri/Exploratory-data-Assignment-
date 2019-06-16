library(data.table)

data <- fread("C:\\Users\\ira\\Desktop\\Data Science Specialisation\\power.txt", sep ="auto",nrows = 2880,
              header =FALSE, na.strings = "?", skip ="1/2/2007", stringsAsFactors = FALSE)
colnames(data)<- c("Date", "Time", "Global_active_power", "Global_reactive_power", "voltage","Global_intensity","sub_metering_1", "sub_metering_2", "sub_metering_3")

# creating date time object 
datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data <- cbind(data, datetime)


# creating png file

png(file="plot4.png",width=480, height=480)

# creating the plots 
par(mfrow=c(2,2))

# subplot 1
plot(data$datetime, data$Global_active_power, xlab="", ylab ="Global Active Power", type ="l" )


#subplot 2
plot(data$datetime, data$voltage, xlab ="datetime", ylab ="Voltage", type = "l")

# subplot 3
plot(data$datetime, data$sub_metering_1, xlab=""  ,ylab = "Energy sub metering", type ="l")
lines(data$datetime, data$sub_metering_2, type ="l" ,col ="red")
lines(data$datetime, data$sub_metering_3, type ="l" ,col ="blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),box.lty = 1,lty = c(1,1,1),col=c("black","red","blue"))

# subplot 4
plot(data$datetime, data$Global_reactive_power, xlab="", ylab ="Global_Reactive_Power", type ="l" )

dev.off()