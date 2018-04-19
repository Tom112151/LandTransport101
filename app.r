#Still currently in testing

#install necessary libraries if not currently installed yet
#install.packages("shiny")
#install.packages("shinyjs)
#install.packages("leaflet")
#install.packages("jsonlite")
#install.packages("shinydashboard")
#install.packages("rjson")

#load the necessary libraries
library(shiny)
library(shinyjs)
library(leaflet)
library(jsonlite)
library(shinydashboard)

#UI
#Sets up descriptions
ui <- fluidPage( 
   # includeCSS("styles.css"),
  dashboardHeader(title = "Airplane tracker in 1 April 18:00 pm"),
  sliderInput("planeCount","Amount of Planes",1,8,2),
  leafletOutput("mymap") 
)

#Server
server <- function(input, output, session) 
{
  library(jsonlite)
  jsLandTransport = fromJSON("http://public-api.adsbexchange.com/VirtualRadar/AircraftList.json?lat=33.433638&lng=-112.008113&fDstL=0&fDstU=100")
  landTransport <- as.data.frame(jsLandTransport)
  jsLandTransport
   
  values <- reactiveValues()
  
  observe({
    invalidateLater(1000, session)
    landTransport = fromJSON("http://public-api.adsbexchange.com/VirtualRadar/AircraftList.json?lat=33.433638&lng=-112.008113&fDstL=0&fDstU=100")
  })
   
})

}
shinyApp(ui, server)
#airPlanes = read.csv("AircraftList1April1800.csv")
   
  #output$mymap <- renderLeaflet({
   # leaflet(data = airPlanes[1:input$planeCount,]) %>% addTiles() %>%
     # addMarkers(~Longtitude, ~Latitude, popup = ~as.character(Model), label=~as.character(Airlines))
