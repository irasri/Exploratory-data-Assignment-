library(data.table)

data <- fread("C:\\Users\\ira\\Desktop\\Data Science Specialisation\\power.txt", sep ="auto",nrows = 2880,
              header =FALSE, na.strings = "?", skip ="1/2/2007", stringsAsFactors = FALSE)
colnames(data)<- c("Date", "Time", "Global_active_power", "Global_reactive_power", "voltage","Global_intensity","sub_metering_1", "sub_metering_2", "sub_metering_3")

# creating date time object 
datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data <- cbind(data, datetime)
# creating png file
png(file="plot2.png",width=480, height=480)
# plot2
plot(data$datetime, data$Global_active_power, xlab=""  ,ylab ="Global Active Power (kilowatts)", type ="l")
dev.off()