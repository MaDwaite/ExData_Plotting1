plot2 <- function(){
    
    ## Import the data as a data table using fread, subset relevant data.
    library(data.table)
    library(lubridate)
    file <- "exdata_data_household_power_consumption/household_power_consumption.txt"
    table <- fread(file)
    table <- table[66637:69516]
    
    ## Set up the plot window and create the plot
    table$Global_active_power <- as.numeric(table$Global_active_power)
    times <- paste(table$Date, table$Time)
    times <- dmy_hms(times)
    dev.new(width = 480, height = 480, unit = "px")
    plot(times, table$Global_active_power, type="l", ylab="Global Active Power (kilowatts)",
         xlab="", main="")
    
    ## Save the plot to a png
    dev.copy(png, "plot2.png")
    dev.off()
}