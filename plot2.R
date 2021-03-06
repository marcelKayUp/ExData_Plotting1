plot2 <- function(){
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
  png("plot22.png")
  #Subset and plot Data
  plot(asa$DateTime,
       asa$Global_active_power,
       type="l",
       xlab="",
       ylab="Global Active Power (kilowatts)")
  #Close Device
  dev.off()
}