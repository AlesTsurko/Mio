doRelativeFile("../Mio.io")

describe("M",
  it("Should init master channel after being initialized",
    //
    M io
    //
    expect(M channels at(0) != nil) toBeTrue
  ),

  it("M(0) should be of type Channel",
    expect(M(0) type == "Channel") toBeTrue
  )
)

describe("Channel",
  it("Should throw an exception if the user trying to get pattern from out of the maximum range",
    err := "The maximum number of pattern slots per channel is " .. M maximumNumberOfPatternsPerChannel asString
    expect(block(M(0) $(1000))) toThrow(err)
  ),

  it("Method $ should assign pattern to 0 position, if the slot number didn't specified",
    testPat := "0011" 
    //
    M(0) $(testPat)
    //
    expect(M(0) $[0] string) toEqual(testPat)
  ),

  it("Method $ should put multiple patterns at the first slot if a slot didn't specified",
    testPat := list("010", "1101", "0110")
    //
    M(0) $(testPat at(0), testPat at(1), testPat at(2))
    //
    testPat foreach(n, pat,
      expect(M(0) $[n] string) toEqual(pat)
    )
  ),

  it("Method $ should put multiple patterns at given slot",
    testPat := list("110", "1010", "0101")
    randSlotNumber := (Random value * (M maximumNumberOfPatternsPerChannel - 2) + 1) floor
    //
    M(0) $(randSlotNumber, testPat at(0), testPat at(1), testPat at(2))
    //
    testPat foreach(n, str,
      expect(M(0) $(randSlotNumber)[n] string) toEqual(str)
    )
  ),

  it("Should return first pattern with $ method if arguments not specified",
    testPat := "0101"
    //
    M(0) $(testPat)
    //
    expect(M(0) $[0] string) toEqual(testPat)
  ),

  it("Should return default pattern stack with $ at specified index if value at index is nil",
    expect(M(0) $(999)[0] string) toEqual(PatternChain defaultPatternString)
  ),

  it("Should convert strings to patterns if input arguments of $ method are strings, so output should behave as a pattern",
    testInput := "010101010"
    testInput2 := "0003320"
    randSlotNumber := (Random value * M maximumNumberOfPatternsPerChannel - 1) floor
    M(0) $(randSlotNumber, testInput, testInput2)
    expect(M(0) $(randSlotNumber)[0] string) toEqual(testInput)
    expect(M(0) $(randSlotNumber)[1] string) toEqual(testInput2)
  ),

  it("Should convert string if needed, but put patterns into stack if $ getting a mixed input",
    testInput := "00011010" {dur, 0.1, pitch, 59}
    testInput2 := "0923842"
    randSlotNumber := (Random value * M maximumNumberOfPatternsPerChannel - 1) floor

    M(0) $(randSlotNumber, testInput, testInput2)

    expect(M(0) $(randSlotNumber)[0]) toEqual(testInput)
    expect(M(0) $(randSlotNumber)[1] string) toEqual(testInput2)
  ),

  it("Should assign pattern to 0 slot if the only one pattern passed as an argument for $",
    testInput := "000111001010" {dur, 0.4, pitch, 50}
    M(0) $(testInput)
    expect(M(0) $[0]) toEqual(testInput)
  )
)

describe("Pattern Properties",
  it("Should throw an error when user trying to assign nil in properties",
    errMessage := "Pattern properties should be key-value pairs"
    expect(block("0101" {})) toThrow(errMessage)
  ),

  it("Should throw an error when user trying to omit key or value",
    errMessage := "Pattern properties should be key-value pairs"
    expect(block("0101" {dur})) toThrow(errMessage)
    expect(block("0101" {dur, 10, note})) toThrow(errMessage)
  ),

  it("Should assign pattern properties with {}",
    pattern := "0101" {dur, 1, note, 60}
    expect(doMessage(pattern props at("dur"))) toEqual(1)
    expect(doMessage(pattern props at("note"))) toEqual(60)
  ),

  it("After constructing a pattern with properties it should contain pattern string representation",
    patStr := "00001111"
    pattern := patStr {dur, 0.5, note, 48}
    expect(pattern string) toEqual(patStr)
  )
)
