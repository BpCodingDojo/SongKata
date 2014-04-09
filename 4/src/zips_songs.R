library(plyr)
library(dplyr)
get_zips_songs_list <- function (input) {
  #qi = fi / zi
  result_count <- get_number_of_result_list(input)
  data <- read_input_into_dataframe(input)
  
  data$i <- as.numeric(rownames(data))
  names(data) <- c("fi","name","i")
  
  data$qi <- data$fi/(1/data$i)
  head(arrange(data, desc(qi)) %.% select(name),result_count)
  
  
}


get_number_of_result_list <- function (input) {
  as.numeric(as.character(as.data.frame(read.table(header = FALSE, text = input))[1,2]))
}



read_input_into_dataframe <- function(input) {
  as.data.frame(read.table(header = FALSE, text = input,skip=2))
}

