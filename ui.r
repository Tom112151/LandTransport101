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
      sliderInput("count", "BAKA", 1, 10, 2),
      menuItem("Dashboard"),
        menuSubItem("sub board"),
      menuItem("new 1"),
      menuItem("new 2")
    ),
    
    dashboardBody
    (
      tabItems
      (
        tabItem
        (
          tabName = "Da other wei",
          fluidRow
          (
            box(leafletOuput("map"))
          )
        )
      )
    )
  )
)
