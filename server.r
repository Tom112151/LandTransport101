library(shiny)
library(shinydashboard)
library(leaflet)
library(jsonlite)

shinyserver(function(input, output)
{
  library(jsonlite)
  
  jsonFile = fromJSON("http://api.metro.net/agencies/lametro/vehicles/")
  dataFrame <- as.data.frame(jsonFile)
  newDataFrame <- dataFrame[c(3,4,6,7)]
  
  output$map <- renderLeaflet
  ({
      leaflet(data = newDataFrame[1:input$count,]) %>% addTiles() %>%
      addMarkers(~items.longitude, ~items.latitude, popup = ~as.character(items.heading), label=~as.character(items.id)) 
  })
  
})
