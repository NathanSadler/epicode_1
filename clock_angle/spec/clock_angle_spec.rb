require('rspec')
require('clock_angle')

describe('clock_angle') do

  it('returns the angle between the hour and minute hand on an analog clock') do
    expect(clock_angle("6", "0")).to(eq(180))
  end

  it('knows that if the hour is 12, it should be treated as if it were zero degrees') do
    expect(clock_angle("12", "0")).to(eq(0))
  end

  it('Always returns the smaller value') do
    expect(clock_angle("12", "45")).to(eq(90))
  end
end
