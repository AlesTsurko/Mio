Sequence root := 60
Sequence oct := 0 // octave transposition for C-60
Sequence props := Map clone

Sequence curlyBrackets := method(
  argsNum := call message argCount
  if(argsNum isOdd or argsNum == 0,
    return Exception raise("Pattern properties should be key-value pairs")
  )

  key := ""
  call message arguments foreach(i, v,
    if(i isEven,
      key = v asString,
      self props atPut(key, v)
    )
  )

  self
)

Pattern := Sequence clone
