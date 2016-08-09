library(shiny)
library(datasets)
library(dplyr) 
library(wordcloud)
library(ggplot2)

options(scipen=5)
#setwd("C:\\R\\DevDataProd\\shinyapp")
  dataset <- read.csv("datasetTrim.csv", header = TRUE,na.strings = c("NA","#DIV/0!",""))

  #Did this cleanup on the initial dataset and then saved it to the source to avoid having to do these each time 
  #Find the popularity of each name over time and remove those with less than 10,000
  
  #dataset <- read.csv("NationalNames.csv", header = TRUE,na.strings = c("NA","#DIV/0!",""))
  
  
#   dataTrim <- as.data.frame(
#     dataset %>%
#       group_by(Name) %>%
#       summarize(POPULARITY = sum(Count))) #%>%
#     filter(POPULARITY >= 10000)) 
  
  #replace original dataset with trimmed one containing only popular names
  # dataset <- dataset[(dataset$Name %in%  dataTrim$Name),]
  
  #Take the top 50 for later analysis
  topAllNames <- 
    dataset %>%
    group_by(Name,Gender) %>%
    summarize(POPULARITY = sum(Count))
  
  
  topTFNames <- topAllNames[order(-topAllNames$POPULARITY),][1:25,]
  
  #Get the data for the top All
  topAll <- subset(dataset, Name %in% topTFNames$Name)
  
  

  shinyServer(function(input, output) {
  
  #topNames <- dataTrim[order(-dataTrim$POPULARITY),][1:25,]

  output$caption <- renderText({
    input$caption
  })
  
 output$big_bar <- renderPlot({  
   
   
   topNames <- 
     dataset %>%
     filter(
       Year >= as.numeric(input$Range[1]),
       Year <= as.numeric(input$Range[2])) %>%
     group_by(Name,Gender) %>%
     summarize(POPULARITY = sum(Count))
 

 topNames <- topNames[order(-topNames$POPULARITY),][1:as.numeric(input$obs),]
    
    barplot(topNames$POPULARITY/1000000, las = 2, names.arg = topNames$Name,
            col =  ifelse(topNames$Gender=='M','blue','pink'), main ="Baby Names",
            ylab = "Count (Millions)")
    
  })
  

#   observeEvent(input$update, {
#     
# 
#  
#     })
    
    
  # Make the wordcloud drawing predictable during a session
  wordcloud_rep <- repeatable(wordcloud)
    
  output$make_cloud <- renderPlot({  
      
    
#     output$topBox <- renderValueBox({
#       valueBox(
#         input$obs, "Top Names", icon = icon("fa fa-child"),
#         color =  ifelse(input$Gender=='M','light-blue','fuchsia')
#       )
      
    dataSum <- as.data.frame(
      dataset %>%
        filter(Year >= as.numeric(input$Range[1]),
               Year <= as.numeric(input$Range[2]),
               Gender == input$Gender) %>%
        group_by(Name) %>%
        summarize(POPULARITY = sum(Count)) %>%
        select(Name,POPULARITY))
    
    
    dataSum <- head(dataSum[order(-dataSum$POPULARITY),],as.numeric(input$obs)) 
    
    
    
    wordcloud_rep(dataSum$Name,dataSum$POPULARITY,
                        scale=c(4, 0.5),
                         min.freq=1,
                         max.words=100,
                         random.order = FALSE,
                         rot.per=0.35,
                         use.r.layout=TRUE,
                         colors=brewer.pal(8, "Set1"), 
                         main="Common Baby Names")

        # })
  

  
  })

  
  # observeEvent(input$updateSearch, {
    
  
    
    # output$topCount <-dataName[order(-dataName$Count),][1,2]
    
# 
#     dataName <- as.data.frame(
#       dataset %>%
#         filter(dataset$Name == "Mary",
#                dataset$Year >= 1880,
#                dataset$Year <= 1930) %>%
#         group_by(Year) %>%
#         summarise(Count = sum(Count))) %>%
#    select(Year,Count)
    
    output$distPlot <- renderPlot({

      dataName <- as.data.frame(
        dataset%>%
          filter(tolower(Name) == tolower(input$name),
                 Year >= as.numeric(input$Range[1]),
                 Year <= as.numeric(input$Range[2])) %>%
          group_by(Year) %>%
          summarise(Count = sum(Count)))  %>%
        select(Year,Count)
      
      topYear <- as.character(dataName[order(-dataName$Count),][1,1])
      
      output$topYear <- renderValueBox({
        valueBox(
          topYear, "Top Year", icon = icon("fa fa-child"),
          color =  'purple'
        )
      }) 
      
      
      
      require(ggplot2)
      
      p <- ggplot(dataName, aes(Year,Count)) 
      p <- p + geom_bar(stat="identity")   
      p <-p + theme(axis.text.x=element_text(angle=45, hjust=1, size=14))   
      p
      

    })
  


#     
#     })
    


  })
  

    

    


