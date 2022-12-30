best <- function(state, outcome) {
  ## Read outcome data
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  
  ## Return hospital name in that state with lowest 30-day death
  
  if(outcome == "heart attack") {
    death <- 11
    }
    else(outcome == "heart failure") {
      death <- 17
      }
      else(outcome == "pneumonia") {
        death <- 24}
}


littleframe <- data.frame(outcome[ , "Hospital.Name"], outcome[,death], outcome[ , "State"] )
allstates <- split(littleframe, outcome$State)

statedata <- allstates[[state]]

colnames(statedata) <- c("hospital", "death", "state")
statedata <- 


  "heart attack"
  "heart failue"
  "pnemonia"
  only <- data.frame(outcome$Hospital.Name, outcome$outcome, outcome$state)
  ## rate
}