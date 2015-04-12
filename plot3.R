data<-read.csv("p1_data/household_power_consumption.txt",header = TRUE, sep = ";")

library(lubridate) 
data$Date <- dmy(data$Date)
dadosValidos <- data[ data$Date == ymd( "2007-02-01") | data$Date == ymd("2007-02-02") , ]



png("plot3.png",width = 480,height = 480)

s1<- dadosValidos$Sub_metering_1;
s2<- dadosValidos$Sub_metering_2;
s3<- dadosValidos$Sub_metering_3;

dadosValidos$Sub_metering_1 <- as.numeric(levels(s1))[s1];
dadosValidos$Sub_metering_2 <- as.numeric(levels(s2))[s2];
dadosValidos$Sub_metering_3 <- as.numeric(levels(s3))[s3];


with(dadosValidos,{
        plot(Sub_metering_1 , xaxt = "n", xlab = "" , ylab = "Energy sub metering" ,  type = "l")
        points(Sub_metering_2 ,col="red",xaxt = "n", xlab = "" , ylab = "Energy sub metering" ,  type = "l")
        points(Sub_metering_3 ,col="blue",xaxt = "n",  xlab = "" , ylab = "Energy sub metering" ,  type = "l")
        
})



legend("topright",  c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue") ,pch="____" )
dev.off()
