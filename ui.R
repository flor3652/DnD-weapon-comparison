# Need to load the shiny library
library(shiny)

#Defining UI for miles per gallon application

shinyUI(pageWithSidebar(
  
  headerPanel("D & D Weapon App Using Shiny (Merry Christmas)"),
  
  sidebarPanel(
    
    sliderInput("w1d", "First Weapon's Low and High Damage Ratings:",
                min=1, max=15, value=c(2,6)),
    
    sliderInput("w1h", "First Weapon's Hit Modifier:",
                min=-10, max=10, value=0),
    
    br(),br(), #for spacing
    
    sliderInput("w2d", "Second Weapon's Low and High Damage Ratings:",
                min=1, max=15, value=c(2,6)),
    
    sliderInput("w2h", "Second Weapon's Hit Modifier:",
                min=-10, max=10, value=0)
    
  ),
  
  mainPanel(
#     tableOutput("table"),
    
    h3(textOutput("Plot of Comparative Weapon Efficiencies")),
    
    plotOutput("plot")
  )  
))