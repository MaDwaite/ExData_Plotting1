plot3 <- function(){
    
    ## Import the data as a data table using fread, subset relevant data.
    library(data.table)
    library(lubridate)
    file <- "exdata_data_household_power_consumption/household_power_consumption.txt"
    table <- fread(file)
    table <- table[66637:69516]
    
    ## Set up the plot window and create the plot
    times <- paste(table$Date, table$Time)
    times <- dmy_hms(times)
    dev.new(width = 480, height = 480, unit = "px")
    plot(times, table$Sub_metering_1, type="l", ylab="Energy sub metering",
         xlab="")
    points(times, table$Sub_metering_2, type="l", col="red")
    points(times, table$Sub_metering_3, type="l", col="blue")
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col=c("black", "red", "blue"), lty=1)
    
    ## Save the plot to a png
    dev.copy(png, "plot3.png")
    dev.off()
}