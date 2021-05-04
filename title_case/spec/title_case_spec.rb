require('rspec')
require('title_case')

describe('#title_case') do
  it('capitalizes the first letter of a word') do
    expect(title_case("test")).to(eq("Test"))
  end

  it('capitalizes the first letter of every word in a title with multiple words') do
    expect(title_case("another test")).to(eq("Another Test"))
  end
end
