plot1 <- function() {
    # Load dataset
    power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("?"), stringsAsFactors = FALSE)
    power <- power[power$Date == "2/2/2007" | power$Date == "1/2/2007",]

    png(file = "plot1.png", width = 480, height = 480)

    hist(power$Global_active_power, 
         col="red", 
         main="Global Active Power", 
         xlab="Global Active Power (kilowatts)", 
         ylab="Frequency")

    dev.off()
}