function(input, output) {
  v <- reactiveValues(doPredict = FALSE, doTrain = FALSE)
  
  # Train
  doTrain <- reactive({
    my.train(as.character(input$algorithm))
  })
  
  # Handle Train
  output$table <- renderTable({
    if (v$doTrain == FALSE)
    {
      return()
    }
    doTrain()
  })
  
  # Handle Train Label
  output$labelTrain <- renderText({
    if (v$doTrain == FALSE) {
      return("Come on!! Click on Train! What are you waiting for?!")
    } else{
      return ("The model should have being downloaded in the working directory. 
              If this hasn't happened it's because im a noob, sorry")
    }
  })
  
  # Handle Trained Label
  output$labelTrained <- renderText({
    if (v$doTrain == FALSE) {
      return("Are you ready for this? Nah you are not")
    } else{
      return ("In this table you can check how good the prediction was")
    }
  })
  
  # Handle Train Button
  observeEvent(input$trainButton, {
    v$doTrain <- input$trainButton
  })
  
  # Get Model from File
  getModel <- reactive({
    inFile <- input$modelFile
    
    if (is.null(inFile))
      return(NULL)
    
    my.read(inFile)
  })
  
  # Make a Prediction
  doPrediction <- reactive({
    my.predict(getModel,
               getFeatures)
  })
  
  # Handle Predict
  output$predictedValue <- renderText({
    if (v$doPredict == FALSE)
    {
      return()
    }
    doPrediction()
  })
  
  output$label <- renderText({
    if (v$doPredict == FALSE) {
      return("Upload your mode, fill the form and click on predict, bro.
             Nothing will stop you from clicking on predict wihout fill the form
             I'm too lazy for data validation...")
    } else{
      return ("THERE YOU HAVE!! Awesome, right? I know I'm incredible")
    }
  })
  
  # Handle Predict Button
  observeEvent(input$predictButton, {
    v$doPredict <- input$predictButton
  })
  
  # Grabbing file
  file <- reactive(input$modelFile)
  
  # Handle Form
  getFeatures <- reactive({
    list(
      "age"       = as.numeric(input$age),
      "bmi"       = as.numeric(input$bmi),
      "sex"       = as.factor(input$sex),
      "children"  = as.numeric(input$children),
      "smoker"    = as.factor(input$smoker),
      "region"    = as.factor(input$region)
    )
  })
  
}