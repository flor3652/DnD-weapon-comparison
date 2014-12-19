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
                min=-10, max=10, value=0),
    
    br(),br(),
    
    checkboxInput("changeEA", "I wish to change the enemy armor range.",FALSE),
    
    conditionalPanel(
      condition = "input.changeEA == true",
      numericInput("eaMin", "New Minimum Enemy Armor:",1),
      numericInput("eaMax", "New Maximum Enemy Armor:",20)
    ),
    
    br(),br(),
    
    checkboxInput("changeLegLoc", "I wish to change the legend location.", FALSE),
    
    conditionalPanel(
      condition = "input.changeLegLoc == true",
      selectInput("legLoc", 
                  "Location of The Legend",
                  list("Top Right"="topright",
                       "Top Left"="topleft",
                       "Bottom Right"="bottomright",
                       "Bottom Left"="bottomleft"))
    )
    
  ),
  
  mainPanel(
#     tableOutput("table"),
    
    h3(textOutput("Plot of Comparative Weapon Efficiencies")),
    
    plotOutput("plot")
  )  
))