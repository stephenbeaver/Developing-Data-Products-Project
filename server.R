shinyServer(function(input, output) {
    library(plotly)
    library(dplyr)
    data <- data.frame(Titanic)
    dt <- aggregate(Freq~Class+Survived, data, sum)
    
    firstdead <- dt[1,3]
    seconddead <- dt[2,3]
    thirddead <- dt[3,3]
    crewdead <- dt[4,3]
    
    firstalive <- dt[5,3]
    secondalive <- dt[6,3]
    thirdalive <- dt[7,3]
    crewalive <- dt[8,3]
    
    f <- list(
        family = "Courier New, monospace",
        size = 18,
        color = "#7f7f7f"
    )
    
    output$plot <- renderPlotly({
        
        p <- plot_ly(data, x = data$Freq, y = data$Class, color = factor(data$Survived))
        p <- p %>% layout(title = "Titanic Survival by Class", titlefont = f)
        p <- p %>% layout(xaxis = list(title = '# of People', titlefont = f))
        p <- p %>% layout(yaxis = list(title = 'Class', titlefont = f))
        p  
    })
    
    output$crew <- renderText({
        if(input$crew){
            crewalive/(crewalive+crewdead)
        }
    })
    
    output$thrid <- renderText({
        if(input$third){
            thirdalive/(thirdalive+thirddead)
        }
    })
    
    output$second <- renderText({
        if(input$second){
            secondalive/(secondalive+seconddead)
        }
    })
    
    output$first <- renderText({
        if(input$first){
            firstalive/(firstalive+firstdead)
        }
    })

})
