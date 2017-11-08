Pattern := Object clone do(
  root := M root
  oct := 0 // octave transposition for root
  props := Map clone
  string := nil
)

Sequence do (
  // returns pattern with given props
  curlyBrackets := method(
    argsNum := call message argCount
    if(argsNum isOdd or argsNum == 0,
      return Exception raise("Pattern properties should be key-value pairs")
    )

    key := ""
    pattern := self asPattern
    call message arguments foreach(i, v,
      if(i isEven,
        key = v asString,
        pattern props atPut(key, v)
      )
    )

    pattern
  )

  asPattern := method(
    pattern := Pattern clone
    pattern string = self
    return pattern
  )
)

