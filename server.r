library(shiny)
library(shinydashboard)
library(leaflet)
library(jsonlite)

shinyServer(function(input, output)
{
  library(jsonlite)
  
  jsonFile = fromJSON("http://api.metro.net/agencies/lametro/vehicles/")
  dataFrame <- as.data.frame(jsonFile)
  newDataFrame <- dataFrame[c(3,4,6,7)]
  
  output$map <- renderLeaflet
  ({
      leaflet(data = newDataFrame[1:input$count,]) 
      leaflet(quakes) %>% addTiles() %>%
      fitBounds(~min(items.longitude), ~min(items.latitude))
  })
  
})
