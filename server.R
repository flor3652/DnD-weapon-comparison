# Need to load the shiny library
library(shiny)

shinyServer(function(input, output){
  
  #copy everything but plot into reactive({}), then put plots in output$plot <- renderPlot 
  
  data <- reactive({
    
    h1r <- input$w1d #Hit lows and highs of the first weapon
    h2r <- input$w2d  #Hit lows and highs of the second weapon
    c   <- input$w2h - input$w1h     #attack modifier (hit modifier) of the second weapon minus the first
    h1  <- sum(h1r)/2  #Average damage per hit of weapon 1
    h2  <- sum(h2r)/2  #Average damage per hit of weapon 2
    ea  <- 1:20    #Possible enemy armor ratings
    wp1eff <- h1*((21/20)-(ea/20))  #Weapon 1 efficiency
    wp2eff <- h2*((21/20)-(ea/20) + (c/20))  #Weapon 2 efficiency
    list(w1e=wp1eff,w2e=wp2eff)
    
  })
  
  #Make the output plot
  
  output$plot <- renderPlot({
    #note that these aren't "needed", just used for convenience when copying over old plot code
    wp1eff <- data()$w1e
    wp2eff <- data()$w2e
    
    plot(wp1eff, type="o", col="blue", xlab="Enemy Armor Rating", ylab="Efficiency (Damage per Turn)",col.lab=rgb(0,0.5,0)); lines(wp2eff, type="o", pch=22, lty=2, col="red")
    legend("topright",c("Weapon 1 Efficiency","Weapon 2 Efficiency"), cex=0.8, col=c("blue","red"), pch=21:22, lty=1:2)
  })
  
#   output$table <- renderTable({
#     data.frame(x=data())
#   })
  
})





#### update ideas ---
# create a function for calculations (so that they can be edited more conveniently)
# give users the option of where to place the legend (top right, top left, bottom right, bottom left)