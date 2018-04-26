library(shiny)
library(shinydashboard)
library(leaflet)

shinyUI
(
  dashboardPage
  (
    dashboardHeader
    (
      title = "DA WEI"
    ),
    
    dashboardSidebar
    (
      menuItem("Dashboard"),
        menuSubItem("sub board", tabName = "map"),
      menuItem("new 1"),
      menuItem("new 2")
    ),
    
    dashboardBody
    (
      leafletOutput("map"),
      tabItems
      (
        tabItem
        (
          tabName = "map",
          fluidRow
          (
            box(leafletOutput("map")),
            box(sliderInput("count", "numbah", 1, 8, 2))
          )
        )
      )
    )
  )
)
