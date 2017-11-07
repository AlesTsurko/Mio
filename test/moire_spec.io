Importer addSearchPath("..")

M io
Channel

describe("M",
  it("Should init master channel after being initialized",
    expect(M channels at(0) != nil) toBeTrue
  ),

  it("M[0] should be of type Channel",
    expect(M[0] type == "Channel") toBeTrue
  )
)

// import Channel
Channel
describe("Channel",
  it("Should assign pattern with $ operator",
    newPattern := "0101"
    M[0] $ newPattern
    expect(M[0] p) toEqual(newPattern)
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
