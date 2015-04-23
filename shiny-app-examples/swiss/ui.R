# This app allows interactive exploration of Swiss socioeconomic
# relationships.

# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
data(swiss)

shinyUI(fluidPage(

  # Application title
  titlePanel("Swiss Socioeconomic Exploration (circa 1888)"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("selectedAttributes", label = h4("Cluster Attributes Shown"), 
                         choices = colnames(swiss),#list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3),
                         selected = c("Fertility", "Agriculture", "Catholic")),
      sliderInput("k", "Number of cluster means (k):", min = 2, max = 5, value = 3),
      h4("Predict % Pose-Secondary Education:"),
      sliderInput("Fertility", "Fertility:", min = min(swiss$Fertility), 
                  max = max(swiss$Fertility), value = mean(swiss$Fertility)),
      sliderInput("Agriculture", "Agriculture:", min = min(swiss$Agriculture), 
                  max = max(swiss$Agriculture), value = mean(swiss$Agriculture)),
      sliderInput("Examination", "Examination:", min = min(swiss$Examination), 
                  max = max(swiss$Examination), value = mean(swiss$Examination)),
      sliderInput("Catholic", "Catholic:", min = min(swiss$Catholic), 
                  max = max(swiss$Catholic), value = mean(swiss$Catholic)),
      sliderInput("Infant.Mortality", "Infant Mortality:", min = min(swiss$Infant.Mortality), 
                  max = max(swiss$Infant.Mortality), value = mean(swiss$Infant.Mortality))
    ),
    

    # Show a plot of the generated distribution
    mainPanel(
      h4("Cluster Plot"),
      plotOutput("distPlot"),
      #h5("Predicted Post-secondary Education %:"), 
      h4(textOutput("predEducation"))
    )
  )
))
