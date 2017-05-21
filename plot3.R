library(dplyr)
powerConsu <- read.table(file("data/household_power_consumption.txt", "r"), 
                         sep = ";",
                         header = TRUE,
                         na.strings = "?") %>%
    filter(Date %in% c("1/2/2007", "2/2/2007"))

powerConsu %>%
    mutate(datetime = as.POSIXct(
        paste(powerConsu$Date, powerConsu$Time), 
        format="%d/%m/%Y %H:%M:%S")) -> powerConsu

#Plot 3
png(file = "plot3.png",width = 480,height = 480)

with(powerConsu, plot(datetime, Sub_metering_1, 
                      type = "l",
                      xlab = "",
                      ylab = "Energy sub metering"))
with(powerConsu, lines(datetime, Sub_metering_2, col = "red"))
with(powerConsu, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "blue", "red"),
       lwd = 1,
       cex = 0.75)

dev.off()