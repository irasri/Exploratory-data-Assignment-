library(data.table)

data <- fread("C:\\Users\\ira\\Desktop\\Data Science Specialisation\\power.txt", sep ="auto",nrows = 2880,
              header =FALSE, na.strings = "?", skip ="1/2/2007", stringsAsFactors = FALSE)
colnames(data)<- c("Date", "Time", "Global_active_power", "Global_reactive_power", "voltage","Global_intensity","sub_metering_1", "sub_metering_2", "sub_metering_3")

# creating date time object 
datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data <- cbind(data, datetime)
# creating png file
png(file="plot3.png",width=480, height=480)
# plot3
plot(data$datetime, data$sub_metering_1, xlab=""  ,ylab = "Energy sub metering", type ="l")
lines(data$datetime, data$sub_metering_2, type ="l" ,col ="red")
lines(data$datetime, data$sub_metering_3, type ="l" ,col ="blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bg="white")
dev.off()