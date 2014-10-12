# load the dataset
data <- read.csv("household_power_consumption.txt", sep=";", 
                 na.strings="?", stringsAsFactors=FALSE)

# subset to relevant dates
data$Date <- as.Date(data$Date,"%d/%m/%Y")
idx <- ( data$Date == as.Date("2007-02-01") | 
           data$Date == as.Date("2007-02-02"))
data <- data[idx,]

# plot the histogram
hist(data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

# save as png file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()