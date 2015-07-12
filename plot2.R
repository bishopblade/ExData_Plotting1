plot2 <- function() {
  # Load dataset
  power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("?"))
  
  # Change date column to Date class and subset to data collected from February 1 and 2 of 2007
  power$Date = as.Date(power$Date, format="%d/%m/%Y")
  power <- power[power$Date == "2007-02-01" | power$Date == "2007-02-02",]
  
  # Create combined datetime column
  power$dateTime = as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")

  # Open graphics device
  png(file = "plot2.png", width = 480, height = 480)

  plot(power$dateTime, power$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
  lines(power$dateTime, power$Global_active_power)

  # Close device
  dev.off()
}