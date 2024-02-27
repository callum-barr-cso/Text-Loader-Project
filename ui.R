ui <- fluidPage(
  
  titlePanel("Text Analyser"),
  
  sidebarLayout(
    
    # Box on left where data/parameters are chosen
    sidebarPanel(
      
      # User chooses a default file or their own
      selectInput(
        inputId = "which_file",
        label = "Which file will you use?",
        choices = c("Custom File", list.files("../Data")),
        selected = "1984"
      ),
      
      conditionalPanel(
        condition = "input.which_file == 'Custom File'",
        # User inputs their own file
        fileInput(
          inputId = "custom_file",
          label = "Choose a text file",
          accept = ".txt"
        )
      ),
      
      # Slider for word length
      sliderInput(
        inputId = "word_length",
        label = "How many letters?",
        min = 2,
        max = 20,
        value = c(3,7)
      ),
      
      # Button to begin analysis
      actionButton(
        inputId = "start_button",
        label = "Begin Analysis",
        icon = icon("magnifying-glass-chart"),
        style ='padding:30px; font-size:150%'
      ),
      
      textOutput("debug_text")
    ),
    
    
    # Main body where data is visualised
    mainPanel(
      tabsetPanel(
        
        # DataTable showing frequency of words
        tabPanel(
          title = "Frequency Table",
          icon = icon("table"),
          DT::DTOutput("textDT")
        ),
        
        # Plot showing occurance of letters starting with each letter
        tabPanel(
          title = "Letter Plot",
          icon = icon("chart-column"),
          plotly::plotlyOutput("letterPlot"),
          DT::DTOutput("letterDT")
        )
      )
    )
  )
)