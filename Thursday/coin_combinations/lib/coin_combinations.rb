#!/usr/bin/env ruby
class CoinCombination

  attr_accessor(:cents)

  def initialize
    @cents = 0
  end

  def get_cents
    @cents = gets.chomp.to_i
    return @cents
  end

  def get_needed_coins
    cents_remaining = @cents
    coins_needed = {:quarters => 0, :dimes => 0, :nickels => 0, :pennies => 0}

    quarters = (cents_remaining / 25)
    coins_needed[:quarters] += quarters
    cents_remaining -= (quarters * 25)

    dimes = (cents_remaining / 10)
    coins_needed[:dimes] += dimes
    cents_remaining -= (dimes * 10)

    nickels = (cents_remaining / 5)
    coins_needed[:nickels] += nickels
    cents_remaining -= (nickels * 5)

    coins_needed[:pennies] += cents_remaining

    coins_needed
  end

end

coin_combiner = CoinCombination.new
puts("Enter a number of cents to get change for: ")
coin_combiner.get_cents
print(coin_combiner.get_needed_coins)
