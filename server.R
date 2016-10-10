# Capstone
# server.R
# York Huang

library(shiny)
library(stringi)

# Load Data
w3g<- read.table(file=gzfile("w3g.csv.gz"), header=T, sep="\t")



predict_next_word <- function(str, w3) {
  str <- stri_replace_all_regex(stri_replace_all_regex(str, '[^[:ascii:]]','' ), '[^a-zA-Z]',' ')
  words <- unlist( stri_split_regex( stri_trim( gsub("\\s+"," ", tolower(str))),pattern = "\\s+") )
  
  ret <- NULL
  
  wlen <- length(words)
  if( wlen >=2 ) {
    str <- paste( words[wlen-1], words[wlen])
    a<- w3[w3$key==str,]
    if(dim(a)[1]>0) {
      e<-character()
      for( i in 1:dim(a)[1]) { 
        e<-c(e, rep(as.character(a$last[i]), a$frequency[i] ) ) 
      }
      ret <- sample(e,1)
    }
  }
  
  if(is.null(ret) && wlen>=1) {
    str <- words[wlen]
    a<- w3[ stri_extract_last_words(w3$key) == str,]
    if(dim(a)[1]>0) {
      e<-character()
      for( i in 1:dim(a)[1]) { 
        e<-c(e, rep(as.character(a$last[i]), a$frequency[i] ) ) 
      }
      ret <- sample(e,1)
    }
  }
  
  if( is.null(ret) ) {
    ret = "Not Found!"
  }
  ret
}

predict_next_word1 <- function(str, w3) {
  str
}

  
shinyServer(
  function(input, output) {
    output$predict_str <- renderText({predict_next_word(input$input_str, w3g)})
    
  }
)