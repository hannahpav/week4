best <- function(state, outcome) {
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
    death <- 23}
  
  ## Check that state and outcome are valid
  
  statenames <- unique(data$State)
  
 statetruth <- state %in% statenames
 outcometruth <- death == 11 || death == 17 || death == 23
 
 if(statetruth == FALSE){
   stop("invalid state")
 }
 if(outcometruth == FALSE){
   stop("invalid outcome")
 }

 if(outcometruth == FALSE || statetruth == FALSE){
   
 }
  
    ## Return hospital name in that state with lowest 30-day death

 #Create a frame just with the three columns we need
littleframe <- data.frame(data[ , "Hospital.Name"], data[,death], data[ , "State"] )
#split the frame into three frames
allstates <- split(littleframe, data$State)

#create a matrix of just our state
statedata <- allstates[[state]]

#rename the columns becasue it's easier
colnames(statedata) <- c("hospital", "death", "state")

#sort the data from low to high
numberdeath <- as.numeric(statedata$death)
newframe <- data.frame(statedata$hospital, numberdeath)
newframe <- na.omit(newframe)
sortedstate <- newframe[order(newframe$numberdeath),]

print(sortedstate[1, 1])
}