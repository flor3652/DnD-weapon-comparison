# Need to load the shiny library
library(shiny)
source("weaponEfficiencyAndPlotFunctions.R")

shinyServer(function(input, output){
  
  #copy everything but plot into reactive({}), then put plots in output$plot <- renderPlot 
  
  data <- reactive({
    #outputs w1e and w2e (list of efficiencies at the armor ratings)
    if(input$changeEA==TRUE) calcEff(input$w1d,input$w2d,input$w1h,input$w2h,c(input$eaMin,input$eaMax)) 
    else calcEff(input$w1d,input$w2d,input$w1h,input$w2h,c(1,20)) 
  })
  
  #Make the output plot
  
  output$plot <- renderPlot({
    wp1eff <- data()$w1e
    wp2eff <- data()$w2e
    
    if(input$changeLegLoc==TRUE)plotEff(data()$w1e, data()$w2e, data()$ea,loc=input$legLoc)
    else plotEff(data()$w1e, data()$w2e, data()$ea)
    
  })
  
#   output$table <- renderTable({
#     data.frame(x=data())
#   })
  
})





#### update ideas ---
# create a function for calculations (so that they can be edited more conveniently)
# give users the option of where to place the legend (top right, top left, bottom right, bottom left)