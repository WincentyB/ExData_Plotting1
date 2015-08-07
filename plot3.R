# Script creating plot3.png file
# There is assumption that input file is located 
# in work directory


# reading and filter data
hpc_FileName <-"household_power_consumption.txt"
hpc_file <- file(hpc_FileName)
hpc_Table <- read.table(text = grep("^[1,2]/2/2007", readLines(hpc_file), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
close(hpc_file)

hpc_Table$Timestamp <-paste(hpc_Table$Date, hpc_Table$Time)


# Generating Plot3 (Timestamp, Energy sub metering)
png("plot3.png", width=480, height=480)
plot(strptime(hpc_Table$Timestamp, "%d/%m/%Y %H:%M:%S"), hpc_Table$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

#Adds lines
lines(strptime(hpc_Table$Timestamp, "%d/%m/%Y %H:%M:%S"), hpc_Table$Sub_metering_2, type = "l", col = "red" )
lines(strptime(hpc_Table$Timestamp, "%d/%m/%Y %H:%M:%S"), hpc_Table$Sub_metering_3, type = "l", col = "blue" )
#Adds legend to graph
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd = 2, col=c("black", "red", "blue"))

#dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()





