// M is the main interface. It's the same as the mixer in a DAW.
M := Object clone do(
  channels := list()

  // init method
  io := method(
    channels append(Channel clone)
  )

  squareBrackets := method(index, channels at(index))
)
