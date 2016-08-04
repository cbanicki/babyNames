library(shiny)

#setwd("C:\\R\\DevDataProd\\shinyapp")

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Baby Names"),
  
  # Sidebar with controls to select the variable to plot against mpg
  # and to specify whether outliers should be included
  sidebarPanel(
    selectInput("Gender", "Choose a Gender:",
                choices=c("M","F")),
    
    sliderInput("Range", label = "Range:",min = 1880, max = 2014, value = c(1880,2014)),


    numericInput("obs", "Number of Names to View:", value = 10, min = 1, max = 100),
    
    
    actionButton("update", "Update Graph")
    
  ),
  

  # Show the caption, a summary of the dataset and an HTML table with
  # the requested number of observations
  mainPanel(
    h3(textOutput("caption")), 
    
    plotOutput("make_cloud")

  )
  
))
