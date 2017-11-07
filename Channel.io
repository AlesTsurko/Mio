// Channel represents a mixer channel.
// Connection to patterns also done here.

Channel := Object clone do(
  p := list(list("0"))
  solo := false
  mute := false

  // pattern getter
  $ := method(
    // change size if needed
    if(self p size != M maximumNumberOfPatternsPerChannel, 
      self p setSize(M maximumNumberOfPatternsPerChannel)
    )

    selectedSlot := 0
    firstArgType := call evalArgAt(0) type
    if(firstArgType == "Number",
      selectedSlot = call evalArgAt(0)
    )

    if(call message argCount < 2 and firstArgType != "Sequence",
      return self getPatternAtSlot(selectedSlot)
    )

    pats := list()
    call message arguments foreach(item,
      compiledItem := call sender doMessage(item)
      if(compiledItem type != "Number", pats append(compiledItem))
    )
    self p atPut(selectedSlot, pats)
  )

  getPatternAtSlot := method(slotNumber,
    if(slotNumber > M maximumNumberOfPatternsPerChannel-1,
      err := "The maximum number of patterns per channel is " .. M maximumNumberOfPatternsPerChannel asString
      return Exception raise(err)
    ) 

    if(self p at(slotNumber) isNil,
      self p atPut(slotNumber, list("0"))
      return self p at(slotNumber)
    ) 
    
    return self p at(slotNumber)
  )
)
