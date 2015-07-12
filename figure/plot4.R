###################################################################################################
## Exploratory Data Analysis Course
## Peer Assessments /Course Project 1
## Author: Raul Zuluaga, raulzuluaga@gmail.com, 20150711
###################################################################################################


## Step 1. Set Working directory
setwd("C:\\R\\04. Exploratory Data Analysis\\Course Project 1")

## Step 2. Read Data
DFpowerConsumption <- read.table("household_power_consumption.txt", 
                                 header = TRUE, 
                                 dec = ".",
                                 sep = ";",
                                 stringsAsFactors = FALSE,
                                 na.strings = "?"
)

## Step 3. Filter data and create a DateTime Column
DFfilteredPowerConsumption <- DFpowerConsumption[   DFpowerConsumption$Date=="1/2/2007" 
                                                    | DFpowerConsumption$Date=="2/2/2007",   ]

rm(DFpowerConsumption)

DateTimeColumn <- as.POSIXct(paste(DFfilteredPowerConsumption$Date, 
                                   DFfilteredPowerConsumption$Time), 
                             format="%d/%m/%Y %H:%M:%S")

DFfilteredPowerConsumption <- cbind( DateTimeColumn , 
                                     DFfilteredPowerConsumption)

## Plot 4

par(mfrow = c(2,2) )
with(DFfilteredPowerConsumption,
{
  plot(DFfilteredPowerConsumption$DateTimeColumn,
       DFfilteredPowerConsumption$Global_active_power,
       ylab = "Global Active Power",
       xlab = "",
       type="l")
  plot(DFfilteredPowerConsumption$DateTimeColumn,
       DFfilteredPowerConsumption$Voltage,
       ylab = "Voltage",
       xlab = "datetime",
       type="l")      
  plot(DFfilteredPowerConsumption$DateTimeColumn,
       DFfilteredPowerConsumption$Sub_metering_1,
       ylab = "Energy sub metering",
       xlab = "",
       type="l",
       col = "black")
  lines(DFfilteredPowerConsumption$DateTimeColumn,DFfilteredPowerConsumption$Sub_metering_2, col = "red")
  lines(DFfilteredPowerConsumption$DateTimeColumn,DFfilteredPowerConsumption$Sub_metering_3, col = "blue")
  legend("topright", 
         legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"),
         col = c("black", "red", "blue"),
         pch = c("_", "_", "_")
  )
  plot(DFfilteredPowerConsumption$DateTimeColumn,
       DFfilteredPowerConsumption$Global_reactive_power,
       ylab = "Global_reactive_power",
       xlab = "datetime",
       type="l")
  
}
)

dev.copy(png, width = 480, height = 480, file= "plot4.png")
dev.off();
