// Channel represents a mixer channel.
// Connection to patterns also done here.
OperatorTable addOperator("$", 15)

Channel := Object clone do(
  p := "0"

  $ := method(value,
    ifNil(value,
      Exception raise("Pattern assign cannot be nil")
    )

    self p = value
  )
)
