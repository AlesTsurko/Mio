/* Importer addSearchPath("jasmineio") */
Importer addSearchPath("..")

Moire init

describe("Moire",
  it("Should init master channel after being initialized",
    expect(Moire channels at(0) != nil) toBeTrue
  ),

  it("Moire[0] should be of type Channel",
    expect(Moire[0] type == "Channel") toBeTrue
  )
)

describe("Channel",
  it("Should assign pattern with $ operator",
    newPattern := "0101"
    Moire[0] $ (newPattern)
    expect(Moire[0] pattern) toEqual(newPattern)
  ),

  it("Should throw an error when trying to set nil as a pattern",
    expect(block(Moire[0]$)) toThrow("Pattern assign cannot be nil")
  )
)

// import pattern
Pattern

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
