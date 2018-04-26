library(shiny)
library(shinyjs)
library(leaflet)
library(jsonlite)
library(shinydashboard)


#UI-------------------------------------------------------------------------------------------------------------------------------------
ui <- fluidPage( 
  #includeCSS("styles.css"),
  dashboardHeader(title = "Live tracker"),
  sliderInput("count","Amount",1,8,2),
  leafletOutput("mymap") 
)

#Server---------------------------------------------------------------------------------------------------------------------------------
server <- function(input, output, session)
{
library(jsonlite)
jsonFile = fromJSON("http://api.metro.net/agencies/lametro/vehicles/")
  dataFrame <- as.data.frame(jsonFile)
  newDataFrame <- dataFrame[c(3,4,6,7)]
  
  jsonFile2 = fromJSON("http://api.metro.net/agencies/lametro/routes/704/stops/")
  dataFrame2 <- as.data.frame(jsonFile2)
  stopsDataFrame <- dataFrame2[c(1,2,3)]
  
  redMarker <- makeIcon(iconUrl = "https://www.iconsdb.com/icons/download/red/map-marker-2-16.png")
  greenMarker <- makeIcon(iconUrl = "https://www.iconsdb.com/icons/download/green/map-marker-2-16.png")
    output$map <- renderLeaflet
({
      leaflet(data = vehicleDataFrame[1:input$count,]) %>% addTiles() %>%
      addAwesomeMarkers(~items.longitude, ~items.latitude, icon=greenMarker, popup = ~as.character(items.heading), label=~as.character(items.id))
	    leaflet(data = stopsDataFrame[1:input$count,]) %>% addTiles() %>%
      addAwesomeMarkers(~items.longitude, ~items.latitude, icon=redMarker, popup = ~as.character(items.route_id), label=~as.character(items.route_id)) 
  })
}) 
}
shinyApp(ui, server)
