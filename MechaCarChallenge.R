library(dplyr)

mecha_car <- read.csv('Data/MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)

linear_model <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_car)

summary(linear_model) #generate summary statistics

susp_coil <- read.csv('Data/Suspension_Coil.csv', check.names = F, stringsAsFactors = F)

total_summary <- susp_coil %>% summarize(Mean=mean(PSI) , Median=median(PSI), Variance=var(PSI), SD=sd(PSI))
total_summary

lot_summary <- susp_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI) , Median=median(PSI), Variance=var(PSI), SD=sd(PSI))
lot_summary

t.test(susp_coil$PSI,mu=mean(susp_coil$PSI))

lot1 <- susp_coil %>% filter(Manufacturing_Lot=='Lot1') 
lot2 <- susp_coil %>% filter(Manufacturing_Lot=='Lot2')
lot3 <- susp_coil %>% filter(Manufacturing_Lot=='Lot3')

t.test(lot1$PSI,mu=mean(susp_coil$PSI)) 
t.test(lot2$PSI,mu=mean(susp_coil$PSI)) 
t.test(lot3$PSI,mu=mean(susp_coil$PSI)) 