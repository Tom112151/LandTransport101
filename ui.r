library(shiny)
library(shinydashboard)

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
      fluidRow
      (
      
      )
    )
  )
)
