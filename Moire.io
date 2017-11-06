// Moire is the main interface. It's the same as the mixer in a DAW.
Moire := Object clone do(
  channels := list()

  init := method(
    channels append(Channel clone)
  )

  squareBrackets := method(index, channels at(index))
)
