plot4 <- function(){
  # Load Data
  asa <- read.table("household_power_consumption.txt",
                    comment.char = "#",
                    header = TRUE, sep = ";",
                    na.strings = "?",
                    colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric"))
  
  # Format Data and Time
  asa$Date <- as.Date(asa$Date, format = "%d/%m/%Y")
  asa$DateTime <- strptime(paste(asa$Date,asa$Time),
                           format="%Y-%m-%d %H:%M:%S")
  #Subsetting
  asa <- asa[asa$Date=="2007-02-01" | asa$Date=="2007-02-02",]
  
  #Open Device
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
}