plotAll <- function(){
  # Load Library
  library(datasets)
  # Load Data
  message("Load Data")
  asa <- read.table("household_power_consumption.txt",
                    comment.char = "#",
                    header = TRUE, sep = ";",
                    na.strings = "?",
                    colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric"))
  # Format Data
  asa$Date <- as.Date(asa$Date, format = "%d/%m/%Y")
  asa$DateTime <- strptime(paste(asa$Date,asa$Time),
                           format="%Y-%m-%d %H:%M:%S")
  #Subsetting
  message("Subsetting Data")
  asa <- asa[asa$Date=="2007-02-01" | asa$Date=="2007-02-02",]
  #Open Device
  message("Plot PNG 1")
  png("plot1.png")
  #plot Data
  hist(asa$Global_active_power,
       col="red",
       xlab="Global Active Power (kilowatts)",
       main="Global Active Power")
  #Close Device
  dev.off()
  #Open Device
  png("plot2.png")
  message("Plot PNG 2")
  #Subset and plot Data
  plot(asa$DateTime,
       asa$Global_active_power,
       type="l",
       xlab="",
       ylab="Global Active Power (kilowatts)")
  #Close Device
  dev.off()
  #Open Device
  png("plot3.png")
  message("Plot PNG 3")
  #plot Data
  plot(asa$DateTime, asa$Sub_metering_1,
       type="l",
       xlab="",
       ylab="Energy sub metering")
  lines(asa$DateTime,
        asa$Sub_metering_2,
        type="l", col="red")
  lines(asa$DateTime,
        asa$Sub_metering_3,
        type="l", col="blue")
  legend("topright", col=c("black","red","blue"), lty=1,
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.off()
  #Open Device
  message("Plot PNG 4")
  png("plot4.png")
  par(mfrow=c(2,2))
  #plot Data
  plot(asa$DateTime,
       asa$Global_active_power,
       type="l",
       xlab="",
       ylab="Global Active Power")
  plot(asa$DateTime,
       asa$Voltage,
       type="l",
       xlab="datetime",
       ylab="Voltage")
  plot(asa$DateTime,
       asa$Sub_metering_1,
       type="l",
       xlab="",
       ylab="Energy sub metering")
  lines(asa$DateTime,
        asa$Sub_metering_2,
        type="l",
        col="red")
  lines(asa$DateTime,
        asa$Sub_metering_3,
        type="l",
        col="blue")
  legend("topright",
         col=c("black","red","blue"),
         lty=1,
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(asa$DateTime,
       asa$Global_reactive_power,
       type="l",
       xlab="DateTime",
       ylab="Global Reactive Power")
  #Close Device 
  dev.off()
  message("All Done")
}