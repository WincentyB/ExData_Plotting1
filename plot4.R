# Script creating plot4.png file
# There is assumption that input file is located 
# in work directory


# reading and filter data
hpc_FileName <-"household_power_consumption.txt"
hpc_file <- file(hpc_FileName)
hpc_Table <- read.table(text = grep("^[1,2]/2/2007", readLines(hpc_file), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
close(hpc_file)

hpc_Table$Timestamp <-paste(hpc_Table$Date, hpc_Table$Time)

# Generating Plot4 
png("plot4.png", width=480, height=480)
#par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
par(mfrow = c(2,2))

scale <- 1.0
plot(strptime(hpc_Table$Timestamp, "%d/%m/%Y %H:%M:%S"), hpc_Table$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power",cex.lab=scale, cex.axis=scale, cex.main=scale, cex.sub=scale)
plot(strptime(hpc_Table$Timestamp, "%d/%m/%Y %H:%M:%S"), hpc_Table$Voltage, type = "l", xlab = "datetime", ylab = "Voltage",
     cex.lab=scale, cex.axis=scale, cex.main=scale, cex.sub=scale)
plot(strptime(hpc_Table$Timestamp, "%d/%m/%Y %H:%M:%S"), hpc_Table$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering",cex.lab=scale, cex.axis=scale, cex.main=scale, cex.sub=scale)
lines(strptime(hpc_Table$Timestamp, "%d/%m/%Y %H:%M:%S"), hpc_Table$Sub_metering_2, type = "l", col = "red" )
lines(strptime(hpc_Table$Timestamp, "%d/%m/%Y %H:%M:%S"), hpc_Table$Sub_metering_3, type = "l", col = "blue" )
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       bty = "n",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
       

plot(strptime(hpc_Table$Timestamp, "%d/%m/%Y %H:%M:%S"), hpc_Table$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_rective_power",cex.lab=scale, cex.axis=scale, cex.main=scale, cex.sub=scale)

#dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()



