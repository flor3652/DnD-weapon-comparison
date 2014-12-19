#ea <- 15 #Enemy Armor Rating
#eh <- 7  #Enemy Health
#mod <- 4 #Attack Bonus (overall)
#(phit <- (21+mod-ea)/20) #Probability of a hit
#dmax <- 8 #max damage (modifiers included)
#dmin <- 3  #min damage (modifiers included)
#(pkill <- sum(dmin:dmax>=eh)/(dmax-dmin+1)) #probability of kill
#phit*pkill #probability of 1 hit kill
#effs <- phit*(mean(dmin:dmax)) #average damage



###### Comparing 2 weapons based on enemy armor ##### Need to fill out through "c" ----
h1r <- c(2,8) #Hit lows and highs of the first weapon
h2r <- c(3,6)  #Hit lows and highs of the second weapon
c   <- -19      #attack modifier (hit modifier) of the second weapon minus the first
h1  <- mean(h1r)  #Average damage per hit of weapon 1
h2  <- mean(h2r)  #Average damage per hit of weapon 2
ea  <- 1:20    #Possible enemy armor ratings
wp1eff <- h1*((21/20)-(ea/20))  #Weapon 1 efficiency
wp2eff <- h2*((21/20)-(ea/20) + (c/20))  #Weapon 2 efficiency

frame()  #Clear earlier graphs

plot(wp1eff, type="o", col="blue", xlab="Enemy Armor Rating", ylab="Efficiency (Damage per Turn)",col.lab=rgb(0,0.5,0), ylim=c(min(wp1eff,wp2eff),max(wp1eff,wp2eff))); lines(wp2eff, type="o", pch=22, lty=2, col="red")

legend("topright",c("Weapon 1 Efficiency","Weapon 2 Efficiency"), cex=0.8, col=c("blue","red"), pch=21:22, lty=1:2)
#axis(1, at=2*0:10,)  #Add ticks on every one on the x axis
#axis(2, at=0:10)  #Add ticks on every one on the y axis
grid()



#### Updating to track modifiers independently ----
# I noticed when doing the graph that, when weapon efficiency increases, it really has no effect on the graph (in the shiny app). Thus we should track the two efficiencies independent of one another, that the graph will be more accurate for each weapon specifically (not just relatively)

h1r <- c(2,8) #Hit lows and highs of the first weapon
h2r <- c(3,6) #Hit lows and highs of the second weapon
am1 <- 19      #the accuracy modifier (from 0) of the first weapon
am2 <- 0      #the accuracy modifier (from 0) of the second weapon
h1  <- mean(h1r)  #Average damage per hit of weapon 1
h2  <- mean(h2r)  #Average damage per hit of weapon 2
ea  <- 1:20    #Possible enemy armor ratings

#note that the following efficiencies assume that a tie goes to the attacker. To give it to the defender, change the 21 to 20 below. These calculations take the average damage and multiply by the probability of a hit (the first entry in sapply). The sapply statement ensures that each element is below 1 and, if it isn't, it will make the element =1.
wp1eff <- h1*(sapply((21-ea+am1)/20, function(x) min(1,x)))  #Weapon 1 efficiency
wp2eff <- h2*(sapply((21-ea+am2)/20, function(x) min(1,x)))  #Weapon 2 efficiency

frame()  #Clear earlier graphs

plot(wp1eff, type="o",pch=21, col="blue", xlab="Enemy Armor Rating", ylab="Efficiency (Average Damage per Turn)",col.lab=rgb(0,0.5,0), ylim=c(min(wp1eff,wp2eff),max(wp1eff,wp2eff))); lines(wp2eff, type="o", pch=22, lty=2, col="red")

legend("topright",c("Weapon 1 Efficiency","Weapon 2 Efficiency"), cex=0.8, col=c("blue","red"), pch=21:22, lty=1:2)
#axis(1, at=2*0:10,)  #Add ticks on every one on the x axis
#axis(2, at=0:10)  #Add ticks on every one on the y axis
grid()


