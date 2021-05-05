require('rspec')
require('queen_attack')

describe('Array#queen_attack?') do
  it('is false if the coordinates are not horizontally, vertically, or diagonally in line with each other') do
    expect([1,1].queen_attack?([2, 3])).to(eq(false))
  end

  it('is true if the x coordinates are the same') do
    expect([1, 2].queen_attack?([1, 3])).to(eq(true))
  end

  it('is true if the y coordinates are the same') do
    expect([3, 4].queen_attack?([5, 4])).to(eq(true))
  end

  it('is true if the coordinates are diagonally in line with each other') do
    expect([5, 1].queen_attack?([7, 3])).to(eq(true))
  end
end
