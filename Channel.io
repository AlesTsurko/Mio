// Channel represents a mixer channel.
// Connection to patterns also done here.
OperatorTable addOperator("$", 15)

Channel := Object clone do(
  p := "0"
  solo := false
  mute := false

  $ := method(value, self p = value)
)
