plot1 <- function(){
    
    ## Import the data as a data table using fread, subset relevant data.
    library(data.table)
    file <- "exdata_data_household_power_consumption/household_power_consumption.txt"
    table <- fread(file)
    table <- table[66637:69516]
    
    ## Set up the plot window and create the plot
    table$Global_active_power <- as.numeric(table$Global_active_power)
    dev.new(width = 480, height = 480, unit = "px")
    hist(table$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",
         main="Global Active Power")
    
    ## Save the plot to a png
    dev.copy(png, "plot1.png")
    dev.off()
}