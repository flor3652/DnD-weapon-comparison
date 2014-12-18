#ea <- 15 #Enemy Armor Rating
#eh <- 7  #Enemy Health
#mod <- 4 #Attack Bonus (overall)
#(phit <- (21+mod-ea)/20) #Probability of a hit
#dmax <- 8 #max damage (modifiers included)
#dmin <- 3  #min damage (modifiers included)
#(pkill <- sum(dmin:dmax>=eh)/(dmax-dmin+1)) #probability of kill
#phit*pkill #probability of 1 hit kill
#effs <- phit*(mean(dmin:dmax)) #average damage



###### Comparing 2 weapons based on enemy armor ##### Need to fill out through "c"
h1r <- c(2,8) #Hit lows and highs of the first weapon
h2r <- c(3,6)  #Hit lows and highs of the second weapon
c   <- 0      #attack modifier (hit modifier) of the second weapon minus the first
h1  <- sum(h1r)/2  #Average damage per hit of weapon 1
h2  <- sum(h2r)/2  #Average damage per hit of weapon 2
ea  <- 1:20    #Possible enemy armor ratings
wp1eff <- h1*((21/20)-(ea/20))  #Weapon 1 efficiency
wp2eff <- h2*((21/20)-(ea/20) + (c/20))  #Weapon 2 efficiency
frame()  #Clear earlier graphs
plot(wp1eff, type="o", col="blue", xlab="Enemy Armor Rating", ylab="Efficiency (Damage per Turn)",col.lab=rgb(0,0.5,0)); lines(wp2eff, type="o", pch=22, lty=2, col="red")
legend(10,(max(wp1eff)),c("Weapon 1 Efficiency","Weapon 2 Efficiency"), cex=0.8, col=c("blue","red"), pch=21:22, lty=1:2)
#axis(1, at=2*0:10,)  #Add ticks on every one on the x axis
#axis(2, at=0:10)  #Add ticks on every one on the y axis
grid()


