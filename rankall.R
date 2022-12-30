rankall <- function(outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ##First I want to convert those outcome measures to the easily 
  ## extractable values in the table
  
  if(outcome == "heart attack") {
    death <- 11
  }
  else if(outcome == "heart failure") {
    death <- 17
  }
  else if(outcome == "pneumonia") {
    death <- 23
  }
  
  if(num =="best"){
    z <- 1}
  else if(num == "worst"){
    z <- length(numberdeath) }
  else { z <- num }
  
  ## Check that state and outcome are valid
  # 
   statenames <- unique(data$State)
  # 
    statetruth <- state %in% statenames
    outcometruth <- death == 11 || death == 17 || death == 23
  # 
   if(statetruth == FALSE){
    stop("invalid state")
  }
  if(outcometruth == FALSE){
    stop("invalid outcome")
  }
  
  #Create a frame just with the three columns we need
  littleframe <- data.frame(data[ , "Hospital.Name"], data[,death], data[ , "State"] )
  
  #rename the columns because it's easier
  colnames(littleframe) <- c("hospital", "death", "state")
  
  cleandata <- data.frame()
  
  for(i in 1:length(littleframe$death)) {
    if(littleframe$death[i] != "Not Available") {
      newrow <- statedata[i, ]
      cleandata <- rbind(cleandata, newrow)
    }
    
  }

  cleandata <- na.omit(cleandata)


  numberdeath <- as.numeric(cleandata$death)
  newframe <- data.frame(cleandata$death, numberdeath, cleandata$state)
  sortedstate <- newframe[order(newframe$numberdeath, newframe[,1]),]
  
  splitdata <- split(sortedstate, sortedstate$state)
  
  str(splitdata)

  # for(i in 1:length(splitdata)) {
  # 
  #   thismatrix <- splitdata[[i]]
  # 
  #   numberdeath <- as.numeric(thismatrix$death)
  #   newframe <- data.frame(thismatrix$hospital, numberdeath)
  # 
  #   sortedstate <- newframe[order(newframe$numberdeath, newframe[,1]),]
  #   newrow <- (sortedstate[z, c(1, 3)])
  #   newframe <- rbind(newframe, newrow)
  # }
  # 
  # print(newframe)
  #take out all "Not Available"


  
  
#   
#   #sort the data from low to high
#   numberdeath <- as.numeric(stateclean$death)
#   newframe <- data.frame(stateclean$hospital, numberdeath)
#   
#   sortedstate <- newframe[order(newframe$numberdeath, newframe[,1]),]
#   rowbow <- length(numberdeath) - 10
#   
#   

#   
#   print(sortedstate[z, 1])
}
