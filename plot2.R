## this file is to read the data and generate the picture file of plot2.png
plot2 <- function(dir="../household_power_consumption.txt") {
        ## 'dir' is a character vector of length 1 indicating
        ## the location of the CSV files, "../household_power_consumption.txt" by default

        ## load the data from dates 2007-02-01 and 2007-02-02
        alldata <- read.csv(dir, header = TRUE, sep = ";", na.strings = "?")
        febdata <- subset(alldata, as.Date(Date,"%d/%m/%Y") == "2007-02-01" | as.Date(Date,"%d/%m/%Y") == "2007-02-02")
        datetime <- strptime(paste(febdata$Date,subset1$Time), "%d/%m/%Y %H:%M:%S")

        ## set device size 480 * 480 pixels
        par(fin = c(480/72, 480/72))
        ## here creates the plot and send it to png file:
        png(file = "plot2.png")
        ## plotting
        plot(datetime,febdata$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
        ## close the file device
        dev.off()
}