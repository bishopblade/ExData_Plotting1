plot1 <- function() {
  # Load dataset
  power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("?"), stringsAsFactors = FALSE)

  # Change date column to Date class and subset to data collected from February 1 and 2 of 2007
  power$Date = as.Date(power$Date, format="%d/%m/%Y")
  power <- power[power$Date == "2007-02-01" | power$Date == "2007-02-02",]

  # Open graphics device
  png(file = "plot1.png", width = 480, height = 480)

  hist(power$Global_active_power, 
       col="red", 
       main="Global Active Power", 
       xlab="Global Active Power (kilowatts)", 
       ylab="Frequency")

  # Close device
  dev.off()
}