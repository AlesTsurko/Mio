// M is the main interface. It's the same as the mixer in a DAW.
M := Object clone do(
  channels := list()
  root := 60
  bpm := 120

  // init method
  io := method(
    // add Master channel
    channels append(Channel clone)
  )

  squareBrackets := method(index, channels at(index))
)
