require('prime_sifting')
require('rspec')

describe('Integer#listfromtwo') do
  it('Returns an array of numbers from two to itself') do
    expect(5.listfromtwo).to(eq([2, 3, 4, 5]))
  end
end

describe('Integer#remove_multiples') do
  it('Removes all multiples of itself from an array of numbers ') do
    expect(6.remove_multiples([2, 3, 4, 5])).to(eq([4, 5]))
  end
end

describe('Integer#prime_sifting') do
  it('Creates an array of numbers from two to itself and removes all' +
  'non-prime numbers from it') do
    expect(7.prime_sifting).to(eq([2, 3, 5, 7]))
  end
end
