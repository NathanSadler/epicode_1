require('rspec')
require('ping_pong')

describe('#ping_pong') do
   it("returns an array of ascending numbers up to the number entered") do
    expect(ping_pong(2)).to(eq([1,2]))
  end

  it("replaces all numbers divisible by 3 but not 5 with 'ping'") do
    expect(ping_pong(3)).to(eq([1, 2, "ping"]))
  end

  it("replaces all numbers divisible by 5 but not by 3 with 'pong'") do
    test_arr = ping_pong(10)
    expect(test_arr[4]).to(eq("pong"))
    expect(test_arr[-1]).to(eq("pong"))
    expect(test_arr.count("pong")).to(eq(2))
  end

  it("replaces all numbers divisible by both 3 and 5 with 'ping-pong'")do
    test_arr = ping_pong(15)
    expect(test_arr[-1]).to(eq("ping-pong"))
    expect(test_arr.count("ping-pong")).to(eq(1))
  end
end
