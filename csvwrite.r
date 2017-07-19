# This cleans by creating subsets of crime data, then saves to a csv file

library(readxl)
crime14 <- read_excel("~/Desktop/OHIOa/crime14.xlsx")
View(crime14)


mur14 <- subset(crime14,  crime14$'MONTH' == '555' , 'MURDER')
mur14
write.csv(mur14, "mur14.csv")

rob14 <- subset(crime14,  crime14$'MONTH' == '555' , 'ROBBERY')
rob14
write.csv(rob14, "rob14.csv")

agg14 <- subset(crime14,  crime14$'MONTH' == '555' , 'AGGRAVATED ASSAULT')
agg14
write.csv(agg14, "agg14.csv")


cou14 <- subset(crime14,  crime14$'MONTH' == '555' , 'AGENCY NAME')
cou14
write.csv(cou14, "cou14.csv")