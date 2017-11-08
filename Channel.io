// Channel represents a mixer channel.
// Connection to patterns also done here.

Channel := Object clone do(
  patternChain := nil
  solo := false
  mute := false

  init := method(
    self patternChain = PatternChain clone
  )

  // pattern getter
  $ := method(
    // change size if needed
    if(self patternChain size != M maximumNumberOfPatternsPerChannel, 
      self patternChain setSize(M maximumNumberOfPatternsPerChannel)
    )

    selectedSlot := 0
    firstArgType := call evalArgAt(0) type
    if(firstArgType == "Number",
      selectedSlot = call evalArgAt(0)
    )

    if(call message argCount < 2 and firstArgType != "Sequence",
      return self patternChain[selectedSlot]
    )

    patternStack := PatternStack clone
    call message arguments foreach(item,
      compiledItem := call sender doMessage(item)
      if(compiledItem type != "Number", patternStack append(compiledItem))
    )
    self patternChain atPut(selectedSlot, patternStack)
  )
)
