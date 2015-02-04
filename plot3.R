plot3 <- function(){
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
  png("plot3.png")
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
}