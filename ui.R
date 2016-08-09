## ui.R ##

library(shiny)
library(shinydashboard)


sidebar <- dashboardSidebar(
  
    tags$hr(),
  
    sliderInput("Range", label = "Birth Years:",min = 1880, max = 2014, value = c(1880,2014), sep = ""),
      
    tags$hr(),
    
        sidebarMenu(
          
              menuItem("Instructions", tabName = "main",
                     badgeLabel = "Select View", icon = icon("fa fa-birthday-cake")),
          
              tags$hr(),
          
              menuItem("Popular Names", icon = icon("fa fa-pie-chart"), tabName = "dashboard",
                       badgeLabel = "Select View", badgeColor = "green"),
          
                  fluidRow(
                    
                    column(6,
                 
                           selectInput("Gender", "Gender:",
                              choices=c("M","F"), width = '100px')),
                    
                    column(6,
                           
                            numericInput("obs", "# Names:", value = 10, min = 1, max = 100, width = '100px'))
                  
                  ),
          
                tags$hr(),
          
                menuItem("Timeline", icon = icon("fa fa-line-chart"), tabName = "widgets",
                         
                          badgeLabel = "Select View", badgeColor = "green"),
                
                          textInput("name", "Name:", value = "", width = '400px', placeholder = "ex. Jim")
                ),
          
              tags$hr()
  
  )


body <- dashboardBody(
  tabItems(
    tabItem(tabName = "main", 
            # Dynamic valueBoxes
            fluidRow(
              column(3,img(src='baby.png', height = 72, width = 100, align = "left")),
              column(9,h2("Popular US Baby Names (1880-2014)"),
                     tags$ul(
                       tags$li("Select a range of birth years to filter by"), 
                       tags$li("Click on 'Select View' to view each chart"), 
                       tags$li("Use the filters to change the gender, and the topN popular names"),
                       tags$li("Type a name to view the popularity of that name over time")
                     )),
              h5("US Baby Names Dataset", a("Link", href="https://www.kaggle.com/kaggle/us-baby-names")), 
              plotOutput("big_bar")
            )
    ),
    tabItem(tabName = "dashboard", 
            # Dynamic valueBoxes
            fluidRow(
            #column(3,img(src='baby.png', height = 72, width = 100, align = "left")),
            column(7,h2("Most Popular Baby Names"))
            ),
            # valueBoxOutput("topBox"),
            plotOutput("make_cloud")
    ),
    
    tabItem(tabName = "widgets",
            valueBoxOutput("topYear"),
            h2("Baby Name Popularity Over Time"),
            #img(src='baby.png', align = "right"),
            plotOutput("distPlot")
    )
  )
)

# Put them together into a dashboardPage
dashboardPage(
  dashboardHeader(title = "US Baby Names"),
  sidebar,
  body
  

)



