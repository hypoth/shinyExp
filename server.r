library(UsingR)
data(galton)

shinyServer(
  function(input, output) {
    output$newPlot <- renderPlot({
      
      if(input$goButton == 1) {
        set.seed(124)
      }    
      
      mn <- as.numeric(input$mn)
      sigma <- as.numeric(input$sigma)
      generatedRandomNumbers <- rnorm(1000, mn, sigma)
      dn <- density(generatedRandomNumbers)
      areaUnderCurve <- sum(dn$y)*diff(dn$x[1:2])
      sigmaCal <- sd(generatedRandomNumbers)
      mnCal <- mean(generatedRandomNumbers)

      output$reactiveText <- renderText({paste("Expected Sigma",round(sigma,4))})
      output$textCalcMean <- renderText({paste("Calculated Mean",round(mnCal,4))})
      output$textCalcSD <- renderText({paste("Calculated sigma",round(sigmaCal,4))})
      output$textAreaUderCurve <- renderText({paste("Area under curve",round(areaUnderCurve,4))})
      
      xmin <- -10
      xmax <-  10
      ymin <- 0
      ymax <- 1.5
      hist(generatedRandomNumbers,probability=TRUE,xlim=c(xmin, xmax),ylim = c(ymin,ymax))
      lines(density(generatedRandomNumbers),col="red")
      
    })
    
  }
)