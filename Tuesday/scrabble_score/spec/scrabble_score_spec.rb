require('rspec')
require('scrabble_score')

describe('#scrabble') do
  it("returns a scrabble score for a letter") do
    expect("a".scrabble()).to(eq(1))
  end

  it("returns the sum of each letter's score for a word") do
    expect("zinc".scrabble).to(eq(15))
  end

end
