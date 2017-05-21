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

#Plot 4
png(file = "plot4.png",width = 480,height = 480)

par(mfrow = c(2, 2))
with(powerConsu, plot(datetime, Global_active_power, 
                      type = "l",
                      xlab = "",
                      ylab = "Global Active Power"))

with(powerConsu, plot(datetime, Voltage, type = "l"))

with(powerConsu, plot(datetime, Sub_metering_1, type = "l"))
with(powerConsu, lines(datetime, Sub_metering_2, col = "red"))
with(powerConsu, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "blue", "red"),
       lwd = 1,
       bty = "n",
       cex = 0.75)

with(powerConsu, plot(datetime, Global_reactive_power, type = "l"))

dev.off()