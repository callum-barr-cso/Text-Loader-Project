# Creates a list containing each word from a .txt file as a separate string.
wordsInFile <- function(my_file) {
  
  # Reads the txt file into lines of text
  my_text <- readLines(my_file)
  
  # Converts each string (separated by any number of spaces) into its own list element
  my_words <- unlist(strsplit(my_text, "\\s+"))
  
  # Removes punctuation ( Punctuation characters; !"#$%&’()*+,-./:;<=>?@[]^_`{|}~ ) and null characters
  my_words <-  vctrs::list_drop_empty(as.list(gsub("[[:punct:]]", "", my_words)))
    
  return(my_words)
  
}











test_file <- "L:/Shiny Practice/Fun Project/Data/1984.txt"
test_output <- wordsInFile(test_file)
myTdm <- as.matrix(TermDocumentMatrix(test_output))
myTdm

