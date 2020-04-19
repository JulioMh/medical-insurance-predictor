ui <- fluidPage(theme = shinytheme("flatly"),navbarPage(
  "Insurance charges predictor",
  tabPanel(
    "Train a ML model!",
    sidebarLayout(
      sidebarPanel(
      #Form
      selectInput(
        "algorithm",
        "Which algorithm do you want to use?",
        choices = c("rpart", "rf", "knn"),
        selected = "rpart"
      ),
      helpText(
        "Don't know which is better, I've just picked for this
                        the ones with a more badass name"
      ),
      actionButton("trainButton", "Train!"),
      helpText(textOutput("labelTrain"))
      
    ),
    mainPanel(h2(textOutput("labelTrained")),
              tableOutput("table"))
  )),
  tabPanel(
    "Use your trained model",
    sidebarLayout(
      sidebarPanel(
        #Input: Select a file ----
        fileInput(
          "modelFile",
          "Choose a model from a RDS File",
          multiple = FALSE,
          accept = ".rds"
        ),
        
        # Horizontal line ----
        tags$hr(),
        
        #Form
        numericInput("age", "Age", value = 0),
        numericInput("children", "Children", value = 0),
        radioButtons(
          "sex",
          "Sex",
          choices = c("female", "male"),
          selected = "Male"
        ),
        numericInput("bmi", "BMI", value = 0),
        radioButtons(
          "smoker",
          "Smoker?",
          choices = c("yes", "no"),
          selected = "Yes"
        ),
        selectInput(
          "region",
          "USA region",
          choices = c("northeast", "northwest", "southwest", "southeast"),
          selected = "northeast"
        ),
        actionButton("predictButton", "Predict!")
      ),
      mainPanel(h3(textOutput("label")),
                verbatimTextOutput("predictedValue"))
    )
  )
))
