require('coin_combinations')
require('rspec')

describe('CoinCombination#get_cents') do
  it('Returns the number of cents the user inputs') do
    foo = CoinCombination.new
    allow(foo).to receive(:gets) {'12'}
    expect(foo.get_cents).to(eq(12))
  end
end

describe('CoinCombination#get_coins') do
  it('Returns the number of quarters needed to make change') do
    quarter_test = CoinCombination.new
    allow(quarter_test).to receive(:gets) {'75'}
    quarter_test.get_cents
    expect(quarter_test.get_needed_coins[:quarters]).to(eq(3))
  end

  it('Returns the number of dimes needed to make change') do
    dime_test = CoinCombination.new
    dime_test.cents = 20
    expect(dime_test.get_needed_coins[:dimes]).to(eq(2))
  end

  it('Returns the number of nickels needed to make change') do
    nickel_test = CoinCombination.new
    nickel_test.cents = 5
    expect(nickel_test.get_needed_coins[:nickels]).to(eq(1))
  end

  it('Returns the number of pennies needed to make change') do
    penny_test = CoinCombination.new
    penny_test.cents = 4
    expect(penny_test.get_needed_coins[:pennies]).to(eq(4))
  end

  it('Uses multiple thpes of coins to make change if it needs to') do
    multi_coin_test = CoinCombination.new
    multi_coin_test.cents = 48
    expect(multi_coin_test.get_needed_coins[:quarters]).to(eq(1))
    expect(multi_coin_test.get_needed_coins[:dimes]).to(eq(2))
    expect(multi_coin_test.get_needed_coins[:nickels]).to(eq(0))
    expect(multi_coin_test.get_needed_coins[:pennies]).to(eq(3))
  end
end
