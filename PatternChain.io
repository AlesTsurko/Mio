if(M ?maximumNumberOfPatternsPerChannel isNil, doRelativeFile("M.io"))

PatternChain := List clone do(
  defaultPatternString := "0"

  squareBrackets := method(slotNumber,
    if(slotNumber > M maximumNumberOfPatternsPerChannel-1,
      err := "The maximum number of pattern slots per channel is " .. M maximumNumberOfPatternsPerChannel asString
      return Exception raise(err)
    ) 

    if(self at(slotNumber) isNil,
      self atPut(slotNumber, PatternStack clone append(PatternChain defaultPatternString asPattern))
      return self at(slotNumber)
    ) 
    
    return self at(slotNumber)
  )
)
