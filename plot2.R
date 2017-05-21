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

#Plot 2
png(file = "plot2.png",width = 480,height = 480)

with(powerConsu, plot(datetime, Global_active_power,
                      type = "l",
                      xlab = "",
                      ylab = "Global Active Power (kilowatts)"))

dev.off()
