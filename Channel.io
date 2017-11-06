// Channel represents a mixer channel.
// Connection to patterns also done here.
Channel := Object clone do(
  pattern ::= nil

  $ := method(inputPattern,
    if(inputPattern isNil) then(
      Exception raise("Pattern assign cannot be nil")
    ) else (
      setPattern(inputPattern)
    )
  )
)

