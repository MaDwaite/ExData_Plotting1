plot4 <- function(){
    
    ## Import the data as a data table using fread, subset relevant data.
    library(data.table)
    library(lubridate)
    file <- "exdata_data_household_power_consumption/household_power_consumption.txt"
    table <- fread(file)
    table <- table[66637:69516]
    
    ## Set up the plot window
    dev.new(width = 480, height = 480, unit = "px")
    par(mfrow=c(2,2))
    
    ## First plot
    table$Global_active_power <- as.numeric(table$Global_active_power)
    times <- paste(table$Date, table$Time)
    times <- dmy_hms(times)
    plot(times, table$Global_active_power, type="l", ylab="Global Active Power (kilowatts)",
         xlab="", main="")
    
    ## Second plot
    table$Voltage <- as.numeric(table$Voltage)
    plot(times, table$Voltage, type="l", ylab="Voltage",
         xlab="datetime", main="")
    
    ## Third plot
    plot(times, table$Sub_metering_1, type="l", ylab="Energy sub metering",
         xlab="")
    points(times, table$Sub_metering_2, type="l", col="red")
    points(times, table$Sub_metering_3, type="l", col="blue")
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col=c("black", "red", "blue"), lty=1)
    
    ## Fourth plot
    table$Global_reactive_power <- as.numeric(table$Global_reactive_power)
    plot(times, table$Global_reactive_power, type="l", ylab="Global_reactive_power",
         xlab="datetime", main="")
    
    ## Save the plot to a png
    dev.copy(png, "plot4.png")
    dev.off()
}