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
          box
          (
            title = "Heh",
            collapsible = TRUE,
            width = "100%",
            height = "100%",
            leafletOuTput("map"),
            sliderInput("count", "numbah", 1, 8, 2)
          )
        )
      )
    )
  )
)
