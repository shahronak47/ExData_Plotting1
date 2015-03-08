household_power_consumption <- read.csv("D:/My Folder/R/Courses/Coursera/Exploratory Data Analysis/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")


new_frame <- subset(household_power_consumption, Date > "2007-01-31" & Date < "2007-02-03")
table(new_frame$Date)

#2007-02-01 2007-02-02 
# 1440       1440 

rm(household_power_consumption)
png("plot1.png", height=480, width=480)
hist(new_frame$Global_active_power, xlab="Global Active Power (killowatts)", 
     col="red", ylim=c(0,1200), main="Global Active Power")   
dev.off()