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

## Plot 1
hist(DFfilteredPowerConsumption$Global_active_power, col = "red", breaks = 12,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.copy(png, width = 480, height = 480, file= "plot1.png")
dev.off();
