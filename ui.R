library(shiny)
library(plotly)
shinyUI(fluidPage(
    titlePanel("Titanic Survivial App"),
    sidebarLayout(
        sidebarPanel(
            h3("Check Box and Submit to See Survival Rate"),
            h4("Take a guess based on the graph first"),
            checkboxInput("crew", "Show Crew Survival Rate", value = FALSE),
            checkboxInput("third", "Show 3rd Class Survival Rate", value = FALSE),
            checkboxInput("second", "Show 2nd Class Survival Rate", value = FALSE),
            checkboxInput("first", "Show 1st Class Survival Rate", value = FALSE),
            submitButton("Submit")
        ),
    mainPanel(
        plotlyOutput("plot"),
        h3("Crew Survival Rate:"),
        textOutput("crew"),
        h3("3rd Class Survival Rate:"),
        textOutput("thrid"),
        h3("2nd Class Survival Rate:"),
        textOutput("second"),
        h3("1st Class Survival Rate:"),
        textOutput("first")
        )
    )
))