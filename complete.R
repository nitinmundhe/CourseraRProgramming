complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  workdir <- getwd()  
  setwd(directory)  
  files <- list.files(path=getwd(), pattern=".csv", all.files=T, full.names=F)
  mat <- data.frame()
  
  for(i in id){
    file <- read.csv(files[i],header = TRUE)
    mat <- rbind(mat,c(as.numeric(strtrim(files[i],3)),nrow(na.omit(file))))
  }
  
  setwd(workdir)
  colnames(mat) <- c("id","nobs")
  mat  
}