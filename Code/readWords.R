 # Word List #
# test_file <- "L:/Shiny Practice/Fun Project/Data/1984.txt"

readWords <- function(file_input){
  my_words <- readLines(file_input)
    
  # Removes punctuation ( Punctuation characters; !"#$%&’()*+,-./:;<=>?@[]^_`{|}~ ) and null characters
  # Replacing with a space as some text use "--" between two words and adding a space making the
  # program able to tell the words apart
  gsub("[[:punct:]]", " ", my_words) %>%

# Converts each string (separated by any number of spaces) into its own list element
  strsplit("\\s+") %>%
  unlist() %>%
  as.list() %>%
  vctrs::list_drop_empty()
  


}


