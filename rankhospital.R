rankhospital <- function(state, outcome, num = "best") {
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
    
    ## Check that state and outcome are valid
    # 
    # statenames <- unique(data$State)
    # 
    # statetruth <- state %in% statenames
    # outcometruth <- death == 11 || death == 17 || death == 23
    # 
    # if(statetruth == FALSE){
    #   stop("invalid state")
    # }
    # if(outcometruth == FALSE){
    #   stop("invalid outcome")
    # }
    
    #Create a frame just with the three columns we need
    littleframe <- data.frame(data[ , "Hospital.Name"], data[,death], data[ , "State"] )
    #split the frame into three frames
    allstates <- split(littleframe, data$State)
    
    #create a matrix of just our state
    statedata <- allstates[[state]]
    
    #rename the columns because it's easier
    colnames(statedata) <- c("hospital", "death", "state")
    
    #take out all "Not Available"
    
    stateclean <- data.frame()
    
    for(i in 1:length(statedata$death)) {
      if(statedata$death[i] != "Not Available") {
        newrow <- statedata[i, ]
        stateclean <- rbind(stateclean, newrow)
      }
        
    }
    
    #sort the data from low to high
    numberdeath <- as.numeric(stateclean$death)
    newframe <- data.frame(stateclean$hospital, numberdeath)

    sortedstate <- newframe[order(newframe$numberdeath, newframe[,1]),]
    rowbow <- length(numberdeath) - 10


  if(num =="best"){
  z <- 1}
    else if(num == "worst"){
  z <- length(numberdeath) }
    else { z <- num }

print(sortedstate[z, 1])
  }
