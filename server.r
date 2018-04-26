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
  
  jsonFile2 = fromJSON("http://api.metro.net/agencies/lametro/routes/704/stops/")
  dataFrame2 <- as.data.frame(jsonFile2)
  stopsDataFrame <- dataFrame2[c(1,2,3)]
  
  
  output$map <- renderLeaflet
  ({
      leaflet(data = newDataFrame[1:input$count,]) %>% addTiles() %>%
      addMarkers(~items.longitude, ~items.latitude, popup = ~as.character(items.heading), label =~as.character(items.id)) %>%
      points(items.longitude, items.latitude, col = "red", cex = .6)
    
  })
  
})
