# Luke A. Miller
# Regional Analysis
# Part B Linear Regression

library(readxl)
library(ggplot2)
Columbus_Lab_file <- read_excel("~/Desktop/miller_RA/Columbus_Lab file.xlsx")
View(Columbus_Lab_file)

### HOVAL
Columbus_Lab_file$`MEAN_HOVAL` <- matrix(mean(Columbus_Lab_file$HOVAL), 49, 1)
Columbus_Lab_file$SD_HOVAL <- matrix(sd(Columbus_Lab_file$HOVAL), 49, 1)
Columbus_Lab_file$C1_HOVAL <- matrix((Columbus_Lab_file$HOVAL - Columbus_Lab_file$MEAN_HOVAL) / Columbus_Lab_file$SD_HOVAL, 49, 1) 

### INC
Columbus_Lab_file$MEAN_INC <- matrix(mean(Columbus_Lab_file$INC), 49, 1)
Columbus_Lab_file$SD_INC <- matrix(sd(Columbus_Lab_file$INC), 49, 1)
Columbus_Lab_file$C2_INCOME <- matrix((Columbus_Lab_file$INC - Columbus_Lab_file$MEAN_INC) / Columbus_Lab_file$SD_INC, 49, 1) 

### C1 * C2
Columbus_Lab_file$`C1*C2` <- matrix((Columbus_Lab_file$C1_HOVAL * Columbus_Lab_file$C2_INCOME), 49, 1)

### SUM
Columbus_Lab_file$SUM <- matrix(sum(Columbus_Lab_file$`C1*C2`), 49, 1)

### N
Columbus_Lab_file$n <- matrix(49, 49, 1)

### Correlation Coefficient
Columbus_Lab_file$`CORR COEFF` <- matrix((Columbus_Lab_file$SUM) / (48), 49, 1)
Columbus_Lab_file$`CORR COEFF`

### Regression (HOVAL ~ INC)
fit1 <- lm(Columbus_Lab_file$HOVAL ~ Columbus_Lab_file$INC)
summary(fit1)

ggplot(Columbus_Lab_file, aes(x=HOVAL,y=INC)) +
  geom_point(shape=18, color="orange3", size=1.85) +
  geom_smooth(method=lm, se=TRUE, color="tan4", size=.5)

### Regression (HOVAL ~ INC CRIME OPEN PLUMB DISCBD)
fit2 <- lm(Columbus_Lab_file$HOVAL ~ Columbus_Lab_file$INC + Columbus_Lab_file$CRIME + Columbus_Lab_file$OPEN + Columbus_Lab_file$PLUMB + Columbus_Lab_file$DISCBD)
summary(fit2)

 
