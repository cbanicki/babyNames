library(shiny)
library(datasets)
library(dplyr) 
library(wordcloud)


  dataset <- read.csv("NationalNames.csv", header = TRUE,na.strings = c("NA","#DIV/0!",""))
 #browser()

  shinyServer(function(input, output) {

  output$caption <- renderText({
    input$caption
  })
  

  observeEvent(input$update, {
    

    dataSum <- as.data.frame(
      dataset %>%
        filter(dataset$Year >= as.numeric(input$Range[1]),
               dataset$Year <= as.numeric(input$Range[2]),
               dataset$Gender == input$Gender) %>%
        group_by(Name) %>%
        summarize(POPULARITY = sum(Count)) %>%
        select(Name,POPULARITY))
    
    
    dataSum <- head(dataSum[order(-dataSum$POPULARITY),],as.numeric(input$obs)) 
    
    
  # Make the wordcloud drawing predictable during a session
  wordcloud_rep <- repeatable(wordcloud)
    
  output$make_cloud <- renderPlot({  
      
    wordcloud_rep(dataSum$Name,dataSum$POPULARITY,
                        scale=c(4, 0.5),
                         min.freq=1,
                         max.words=100,
                         random.order = FALSE,
                         rot.per=0.35,
                         use.r.layout=TRUE,
                         colors=brewer.pal(8, "Dark2"), 
                         main="Common Baby Names")

        })
    
  })

})

