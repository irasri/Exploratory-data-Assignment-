library(data.table)

data <- fread("C:\\Users\\ira\\Desktop\\Data Science Specialisation\\power.txt", sep ="auto",nrows = 2880,
              header =FALSE, na.strings = "?", skip ="1/2/2007", stringsAsFactors = FALSE)
colnames(data)<- c("Date", "Time", "Global_active_power", "Global_reactive_power", "voltage","Global_intensity","sub_metering_1", "sub_metering_2", "sub_metering_3")
# checking for Nas in data frame
a <- sum(is.na(data))
# creating date time object 
datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data <- cbind(data, datetime)

# Creating a png File
png(file="plot1.png",width=480, height=480)
# PLot 1
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", col ="red", main ="Global Active Power")
dev.off()