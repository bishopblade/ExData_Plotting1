plot4 <- function() {
  # Load dataset
  power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("?"))
  
  # Change date column to Date class and subset to data collected from February 1 and 2 of 2007
  power$Date = as.Date(power$Date, format="%d/%m/%Y")
  power <- power[power$Date == "2007-02-01" | power$Date == "2007-02-02",]
  
  # Create combined datetime column
  power$dateTime = as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")
  
  # Open graphics device
  png(file = "plot4.png", width = 480, height = 480)
  
  # Setup 2x2 grid of plots
  par(mfrow=c(2,2))
  
  # Top left plot
  plot(power$dateTime, power$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
  lines(power$dateTime, power$Global_active_power)
  
  # Top right plot
  plot(power$dateTime, power$Voltage, type="n", ylab="Voltage", xlab="datetime")
  lines(power$dateTime, power$Voltage)
  
  # Bottom left plot
  plot(power$dateTime, power$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
  lines(power$dateTime, power$Sub_metering_1, col="black")
  lines(power$dateTime, power$Sub_metering_2, col="red")
  lines(power$dateTime, power$Sub_metering_3, col="blue")
  legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
  
  # Bottom right plot
  plot(power$dateTime, power$Global_reactive_power, type="n", ylab="Global_reactive_power", xlab="datetime")
  lines(power$dateTime, power$Global_reactive_power)
  
  # Close device
  dev.off()
}