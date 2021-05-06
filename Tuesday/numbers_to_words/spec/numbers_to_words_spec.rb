require('rspec')
require('numbers_to_words')

describe('Integer#numbers_to_words') do
  it('writes out the word for the ones place of an integer') do
    expect(3.numbers_to_words).to(eq('three'))
  end

  it('writes out the word for the tens places of an integer') do
    expect(20.numbers_to_words).to(eq('twenty'))
  end

  it('writes out the word for each place of an integer') do
    expect(39.numbers_to_words).to(eq('thirty nine'))
  end

  it('writes out the word for the hundreds place of an integer') do
    expect(300.numbers_to_words).to(eq('three hundred'))
  end

  it('writes out the word for the thousands place of an integer') do
    expect(4000.numbers_to_words).to(eq('four thousand'))
  end

  it('writes out the word for the ten thousands place of an integer') do
    expect(51000.numbers_to_words).to(eq('fifty one thousand'))
  end

  it('writes the word form of integers up to 999.999.999.999 ') do
    expect(999999999999.numbers_to_words).to(eq('nine hundred ninety nine billion' +
    ' nine hundred ninety nine million nine hundred ninety nine thousand nine hundred ninety nine'))
  end

  it('writes out the word form of numbers with a 1 in the ten billion, ten million,
    ten thousand, and tens places.') do
      expect(417000.numbers_to_words).to(eq("four hundred seventeen thousand"))
    end

end
