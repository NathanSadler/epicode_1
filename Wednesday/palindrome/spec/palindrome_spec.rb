require('rspec')
require('palindrome')

describe('String#palindrome?') do
  it('returns true if it is a palindrome') do
    expect("tacocat".palindrome?).to(eq(true))
  end

  it('returns false if it is not a palindrome') do
    expect("foobar".palindrome?).to(eq(false))
  end
end
