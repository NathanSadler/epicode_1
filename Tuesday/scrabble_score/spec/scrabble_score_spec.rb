require('rspec')
require('scrabble_score')

describe('Word#scrabble') do
  it("returns a scrabble score for a letter") do
    expect(Word.new("a").scrabble).to(eq(1))
  end

  it("returns the sum of each letter's score for a word") do
    expect(Word.new("zinc").scrabble).to(eq(15))
  end
end

describe('Sentence#scrabble') do
  it("returns the sum of each word's scrabble score") do
    expect(Sentence.new("Hello World").scrabble).to(eq(17))
  end
end
