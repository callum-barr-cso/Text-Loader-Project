server <- function(input, output) {
  
  output$debug_text <- renderText({"Hello Debugging World"})
  
  
  selected_file <- reactive(
    if(input$which_file == "Custom File") {
      return(input$custom_file$datapath)
    } else{
      return(paste0("../Data/", input$which_file, sep=""))
    }
  )
  
  
  
  
  # Creates a DataTable showing all words in the txt
  output$textDT <- DT::renderDT({
    # "req" means the function will only run once it sees change in input$start_button
    # "isolate" means a change in given inputs won't cause function to update.
    # This all allows user to set parameters before finally giving go-ahead to run
    req(input$start_button)
    wordTable(isolate(selected_file()), input$word_length)

  })
  

  # Creates a plot showing word frequency by their first letter
  output$letterPlot <- renderPlotly({
    req(input$start_button)
    letter_table <- letterTable(isolate(selected_file()), input$word_length)
    
    plot_ly(
      x = names(letter_table),
      y = as.numeric(letter_table),
      type = "bar"
    ) %>%
      
    layout(title = "Word Counts by Starting Letter",
           xaxis = list(title = "Letter"),
           yaxis = list(title = "Count")
           )

  })
  
  
  # Creates a table if a bar is clicked on the letterPlot
  output$letterDT <- DT::renderDT({
    event_data <- req(event_data("plotly_click"))
    if (!is.null(event_data)) {
      clicked_letter <- event_data$x
      filtered_df <- subset(
        # Creates a wordTable and adds a column for first letter
        wordTable(selected_file(), input$word_length ) %>%
        mutate(letter = toupper(substr(text,1,1))), 
        letter == clicked_letter)
      filtered_df
    }
  })
  
  
  
  
  
  
  
  
  
  
  
  
}