# load the dataset
data <- read.csv("household_power_consumption.txt", sep=";", 
                 na.strings="?", stringsAsFactors=FALSE)

# subset to relevant dates
data$Date <- as.Date(data$Date,"%d/%m/%Y")
idx <- ( data$Date == as.Date("2007-02-01") | 
           data$Date == as.Date("2007-02-02"))
data <- data[idx,]

# create date time objects in the time column
data$Time <- strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S")

# plot the line chart
plot(data$Time, data$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")

# save as png file
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()