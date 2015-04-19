data<-read.csv("p1_data/household_power_consumption.txt",header = TRUE, sep = ";")

library(lubridate) 
data$Date <- dmy(data$Date)
dadosValidos <- data[ data$Date == ymd( "2007-02-01") | data$Date == ymd("2007-02-02") , ]

f<- dadosValidos$Global_active_power;
dadosValidos$GAP <- as.numeric(levels(f))[f];

dadosValidos$Date  <- as.Date(dadosValidos$Date) 
dadosValidos$datetime <- ymd_hms(paste(dadosValidos$Date, dadosValidos$Time))

png("plot2.png",width = 480,height = 480)

plot(  dadosValidos$datetime  ,dadosValidos$GAP ,  xlab = "" , ylab = "Global Active Power (kilowats)" ,  type = "l")


dev.off()
