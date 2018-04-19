#install necessary libraries if not currently installed yet
#install.packages("shiny")
#install.packages("plotly")
#install.packages("shinyjs)
#install.packages("leaflet")
#install.packages("jsonlite")

#load the necessary libraries
library(shiny)
library(plotly)
library(shinyjs)
library(leaflet)
library(jsonlite)

#UI
#Sets up descriptions
ui <- fluidPage( 
   # includeCSS("styles.css"),
  dashboardHeader(title = "Airplane tracker in 1 April 18:00 pm"),
  sliderInput("planeCount","Amount of Planes",1,8,2),
  leafletOutput("mymap") 
)

#Server
server <- function(input, output) 
{
  library(jsonlite)
  airPlanes = read.csv("AircraftList1April1800.csv")
  
  output$mymap <- renderLeaflet({
    leaflet(data = airPlanes[1:input$planeCount,]) %>% addTiles() %>%
      addMarkers(~Longtitude, ~Latitude, popup = ~as.character(Model), label=~as.character(Airlines))
})

}
shinyApp(ui, server)
