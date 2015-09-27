shinyUI(pageWithSidebar(
  headerPanel("Behavior or Random number Generator"),
  sidebarPanel(
    sliderInput('mn', 'Enter Mean for random number generator',value = 0, min = -5, max = 5, step = 0.05,),
    sliderInput('sigma', 'Enter SD for random number generator',value = 1, min = 0.3, max = 2, step = 0.05,),
    actionButton("goButton","Reset Seed>>") 
    ),
  mainPanel(
    plotOutput('newPlot'),
    textOutput('textCalcMean'),
    textOutput('reactiveText'),    
    textOutput('textCalcSD'),
    textOutput('textAreaUderCurve'),
    p(''),
    p(''),
    p(''),
    p(''),
    p(''),
    p(''),
    p('----Usage-----'),
    p('This is small app to show behaviour of norm function in R'),
    p('Sliders above are used to give mean and sd parameters to random number generator'),
    p('Seed can be reset any time during the use of app'),
    p('Difference between expected SD/Mean and SD/Mean value calculated from generated numbers are shown as output')
   
  )
))

