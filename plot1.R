plot1 <- function(){
  # Load Library
  library(datasets)
  # Load Data
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
  asa <- asa[asa$Date=="2007-02-01" | asa$Date=="2007-02-02",]
  #Open Device
  png("plot1.png")
  #plot Data
  hist(asa$Global_active_power,
       col="red",
       xlab="Global Active Power (kilowatts)",
       main="Global Active Power")
  #Close Device
  dev.off()
}
