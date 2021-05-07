require('rspec')
require('find_and_replace')

describe("String#find_and_replace") do
  it("replaces specified words in a string with a different specified word") do
    expect("Hello world".find_and_replace('world', 'universe')).to(eq("Hello universe"))
  end

  it("replaces parts of words if they contain the first specified word in them") do
    expect("Mr. Worldwide".find_and_replace("World", "Universe")).to(eq("Mr. Universewide"))
  end
end
