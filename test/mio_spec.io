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

  it("Method $ should assign pattern to 0 position, if the slot number is not specified",
    testPat := "0011"
    //
    M(0) $(testPat)
    //
    expect(M(0) $) toEqual(list(testPat)) 
  ),

  it("Method $ should put multiple patterns at first slot if slot is not specified",
    testPat := list("010", "1101", "0110")
    //
    M(0) $(testPat at(0), testPat at(1), testPat at(2))
    //
    expect(M(0) $) toEqual(testPat)
  ),

  it("Method $ should put multiple patterns at given slot",
    testPat := list("110", "1010", "0101")
    randSlotNumber := (Random value * (M maximumNumberOfPatternsPerChannel - 2) + 1) floor
    //
    M(0) $(randSlotNumber, testPat at(0), testPat at(1), testPat at(2))
    //
    expect(M(0) $(randSlotNumber)) toEqual(testPat)
  ),

  it("Should return first pattern with $ method if arguments not specified",
    testPat := "0101"
    //
    M(0) $(testPat)
    //
    expect(M(0) $) toEqual(list(testPat));
  ),

  it("Should return default pattern with $ at specified index if value at index is nil",
    defaultPat := list("0")
    expect(M(0) $(999)) toEqual(defaultPat)
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
  )
)
