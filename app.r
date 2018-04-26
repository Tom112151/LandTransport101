#Still currently in testing and not in any way finished

#When using this for your own use it's better to retype it than copy and paste so i highly suggest it

#Before you do anything you will need to install a few packages in order for things to work
#All you need to do is type these thing's below (Without the #) in the R console
#install.packages("shiny")
#install.packages("shinyjs)
#install.packages("leaflet")
#install.packages("jsonlite")
#install.packages("shinydashboard")

#You will also need to load the libraries by typing these in the console then you will finally be able to use it
library(shiny)
library(shinyjs)
library(leaflet)
library(jsonlite)
library(shinydashboard)

#UI-------------------------------------------------------------------------------------------------------------------------------------
#Sets up the descriptions in the UI
#You can change the parameters

#the includeCSS is not a note, it will be needed to be there for things to run
#Title is self explanatory
#sliderInput is how much tracked items do you want to see (The 3 number parameters by order is minimum,maximum,default)
#Leaflet creates the map

ui <- fluidPage
( 
  #includeCSS("styles.css"),
  dashboardPage
  (
    dashboardHeader(title = "Live tracker"),
    dashboardSidebar
    (
      #sliderInput("count", "Amount", 1, 1500, 100),
      menuItem("Map"),
        menuSubItem("Bus"),
        menuSubItem("Stops"),
      menuItem("menu1"),
      menuItem("Raw data")
    ),
    dashboardBody
    (
      tabItems
      (
        tabItem
        (
          tabName = "dashboard",
          fluidRow
          (
              #box(leafletOutput("map"))
          )
    )
   )
)

#Server---------------------------------------------------------------------------------------------------------------------------------
server <- function(input, output) 
{
  #jsonlite loaded again to make sure
  library(jsonlite)
  
  #jsLandTransport will read from a json in a website and then landTransport will take jsLandTransport's information and put it into
  #a data frame, the website json that is used for this is written below (The parameter for the website cannot be changed unless you
  #make adjustment to the code)
  jsonFile = fromJSON("http://api.metro.net/agencies/lametro/vehicles/")
  dataFrame <- as.data.frame(jsonFile)
  
  #We will only need some of the data from the frame, so we put that in  a new frame
  newDataFrame <- dataFrame[c(3,4,6,7)]
  
  #Displaying the content of landTransport
  #landTransport
  
  #This will make the map display showing the locations and details on each tracked land transports
  #output$map <- renderLeaflet({
   #leaflet(data = newDataFrame[1:input$count,]) %>% addTiles() %>%
     #addMarkers(~items.longitude, ~items.latitude, popup = ~as.character(items.heading), label=~as.character(items.id)) 
  #})

}
shinyApp(ui, server)
