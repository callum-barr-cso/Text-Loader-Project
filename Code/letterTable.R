
letterTable <- function(file, word_length){
  # Uses the custom readWords() function to get list from .txt file
  my_output <- dplyr::data_frame(text = readWords(file)) %>% 
    
  # Makes all words lowercase for consistency
  mutate(text = tolower(text)) %>% 
  
  # Makes a column showing word length
  mutate(len = nchar(text)) %>%
    
  # Filter words by length
  dplyr::filter(len >= word_length[1],
                len <= word_length[2]) %>%
    
  # Create a column with the first letter of each word
  mutate(letter = toupper(substr(text,1,1)))
    
  # Return a table with the letter as X, and the count as Y
  table <- table(my_output$letter)
    
  return(table)
    
}
