// M is the main interface. It's the same as the mixer in a DAW.
Mstate := Object clone do(
  channels := list()
  root := 60
  bpm := 120
  maximumNumberOfPatternsPerChannel := 1000

  // init method
  io := method(
    // add Master channel
    channels append(Channel clone)
  )
)

M := method(channelNumber,
  if(channelNumber isNil,
    return Mstate,
    return Mstate channels at(channelNumber)
  )
)
