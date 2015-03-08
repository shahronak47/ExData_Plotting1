household_power_consumption <- read.csv("D:/My Folder/R/Courses/Coursera/Exploratory Data Analysis/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")


new_frame <- subset(household_power_consumption, Date > "2007-01-31" & Date < "2007-02-03")
table(new_frame$Date)

#2007-02-01 2007-02-02 
# 1440       1440 

rm(household_power_consumption)
new_frame$DateTime <- paste(new_frame$Date, new_frame$Time)

new_frame$DateTime <-as.POSIXct(new_frame$DateTime)
png("plot3.png", height=480, width=480)
plot(new_frame$DateTime, new_frame$Sub_metering_1, col="blue", xlab="", ylab="Energy sub metering")
lines(new_frame$DateTime,new_frame$Sub_metering_1, col = "black")
lines(new_frame$DateTime,new_frame$Sub_metering_2, col = "red")
lines(new_frame$DateTime, new_frame$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       col=c("black","red","blue"), lwd=1)
dev.off()