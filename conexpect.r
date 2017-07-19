# Luke A. Miller
# Regional Analysis
# Part A Conditional Expectations

library(readxl)
Cholera_Data_Lab_file <- read_excel("~/Desktop/miller_RA/miller_partA.xlsx")
View(Cholera_Data_Lab_file)

### Cleaning 
Cholera_Data_Lab_file <- subset(Cholera_Data_Lab_file, !is.na(Company))
Cholera_Data_Lab_file$Question <- NULL
Cholera_Data_Lab_file$Variable <- NULL
Cholera_Data_Lab_file$Value <- NULL
Cholera_Data_Lab_file$Description <- NULL

### observations & observational units 
length(Cholera_Data_Lab_file)
nrow(Cholera_Data_Lab_file)

###  Subset Company 1
company1 <- subset(Cholera_Data_Lab_file, Company==1)
compsum1 <- sum(company1$Count)
died1 <- sum(company1$Count[company1$Outcome==1])
outc1 <- died1 / compsum1 


### Subset !Company1 
company2 <- subset(Cholera_Data_Lab_file, Company ==2)
compsum2 <- sum(company2$Count)
died2 <- sum(company2$Count[company2$Outcome==1])
outc2 <- died2 / compsum2

teffect1 <- outc1 - outc2

### Subset 'St. Savior, Southwark'
saint1 <- subset(Cholera_Data_Lab_file, `St. Savior, Southwark`==1)
saintsum1 <- sum(saint1$Count)
died3 <- sum(saint1$Count[saint1$Outcome==1])
outc3 <- died3 / saintsum1

### Subset !`St. Savior, Southwark`
saint2 <- subset(Cholera_Data_Lab_file, `St. Savior, Southwark`==0)
saintsum2 <- sum(saint2$Count)
died4 <- sum(saint2$Count[saint2$Outcome==1])
outc4 <- died4 / saintsum2

teffect2 <- outc3 - outc4

### Subset `Bermondsey`
berm1 <- subset(Cholera_Data_Lab_file, `Bermondsey`==1)
bermsum1 <- sum(berm1$Count)
died5 <- sum(berm1$Count[berm1$Outcome==1])
outc5 <- died5 / bermsum1


### Subset !`Bermondsey`
berm2 <- subset(Cholera_Data_Lab_file, `Bermondsey`==0)
bermsum2 <- sum(berm2$Count)
died6 <- sum(berm2$Count[berm2$Outcome==1])
outc6 <- died6 / bermsum2

teffect3 <- outc5 - outc6


