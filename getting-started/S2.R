favorite_number <- 29
times=c(6,9,8,5,2.5,5,7.5)
mean(times)
mins = 60*times
times * 1:6
times * 1:8
t=c(times, NA)
mean(t, na.rm = FALSE)
sd(times)
range(t, na.rm=TRUE)
length(times)
all(times<6)
any(times<6)
which(times<6)
times[which(times<6)]
times[2:5]
t[!is.na(t)]
times[2]<-NA
times[times<5]<-NA
