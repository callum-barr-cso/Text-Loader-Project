# Converts a list of words into a dataframe showing frequency
wordTable <- function(file, word_length){
  
  # Uses the custom readWords() function to get list from .txt file
  my_output <- dplyr::data_frame(text = readWords(file)) %>% 
    
  # Makes all words lowercase for consistency
  mutate(text = tolower(text)) %>% 
    
  # Turns each element in the list-column into its own row.
  unnest(cols = c()) %>% 
  count(text) %>% 
    
  # Stopwords are short words that we exclude eg. "the, and, his"
  dplyr::filter(!text %in% stopwords::stopwords()) %>% 
  # The reason we do freq twice is so that it first appers before len, and then gets recalculated
  mutate(freq = round(n / sum(n),3)) %>% 
  mutate(len = nchar(text)) %>%

  
  # Filter words by length
  dplyr::filter(len >= word_length[1],
                len <= word_length[2]) %>%
    
  # Recalculate frequency as freq of new subset, converting to a percentage
  mutate(freq = paste0(round(100 * n / sum(n),2), "%")) %>%
  
  # Sorts table in descending order by number of occurrences
  arrange(desc(n))
}