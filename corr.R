corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  workdir <- getwd()
  com <- complete(directory)
  setwd(directory)  
  files <- list.files(path=getwd(), pattern=".csv", all.files=T, full.names=F)
  #mat <- data.frame(sulfate = numeric(0),nitrate=numeric(0))
  vec <- vector()
  for(i in seq_along(files)){
    if( com[i,2] > threshold ) {
    file <- na.omit(read.csv(files[i],header = TRUE))    
    vec <- c(vec,cor(file$sulfate, file$nitrate))
    }
  }
  setwd(workdir)  
  vec
}