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
  
  
  #Translate the second outcome into what they actually mean
  if(num =="best"){
    z <- 1}
  else if(num == "worst"){
    z <- length(numberdeath) }
  else { z <- num }
  
  ## Check that state and outcome are valid
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
  
  #create empty frame to put in the new clean data
  cleandata <- data.frame()
  
  for(i in 1:length(littleframe$death)) {
    if(littleframe$death[i] != "Not Available") {
      newrow <- littleframe[i, ]
      cleandata <- rbind(cleandata, newrow)
    }
    
  }

  #Create numeric vector so we can sort
  numberdeath <- as.numeric(cleandata$death)
  
  #create a sorted frame
  newframe <- data.frame(cleandata$hospital, numberdeath, cleandata$state)
  sortedframe <- newframe[order( newframe[,3],newframe$numberdeath, newframe[,1]),]
  
  #split the frame into states
  splitdata <- split(sortedframe, sortedframe$cleandata.state)

  # Create empty matrix that we will use for everything
  newmatrix <- data.frame()
  
  print(splitdata[[1]])
  # Extract the correct row
  # for(i in 1:length(splitdata)) {
  # 
  #   thismatrix <- splitdata[[i]]
  #   
  #   #extract the row and add to matrix
  #   newrow <- (thismatrix[z, c(1, 3)])
  #   newmatrix <- rbind(newmatrix, newrow)
  # }

  # Remove NA
 # newmatrix <- na.omit(newmatrix)
  #rename the columns because it's easier
  # colnames(newmatrix) <- c("hospital", "state")
  # print(newmatrix)

}
