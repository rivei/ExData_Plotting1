## this file is to read the data and generate the picture file of plot3.png
plot3 <- function(dir="../household_power_consumption.txt") {
        ## 'dir' is a character vector of length 1 indicating
        ## the location of the data files, "../household_power_consumption.txt" by default

        ## load the data from dates 2007-02-01 and 2007-02-02
        alldata <- read.csv(dir, header = TRUE, sep = ";", na.strings = "?")
        febdata <- subset(alldata, as.Date(Date,"%d/%m/%Y") == "2007-02-01" | as.Date(Date,"%d/%m/%Y") == "2007-02-02")
        datetime <- strptime(paste(febdata$Date,febdata$Time), "%d/%m/%Y %H:%M:%S")

        ## set device size 480 * 480 pixels
        par(fin = c(480/72, 480/72))
        ## here creates the plot and send it to png file:
        png(file = "plot3.png")
        ## plotting:
        plot(datetime,febdata$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering")
        lines(datetime, febdata$Sub_metering_2, col="red")
        lines(datetime, febdata$Sub_metering_3, col="blue")
        legend("topright", pch = c("-","-","-"), col=c("black","blue","red"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
        ## close the file device
        dev.off()
}