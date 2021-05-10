#!/usr/bin/env ruby

# Create a hash where the keys are powers of 2 and the values are allergens
allergens = [:eggs, :peanuts, :shellfish, :strawberries, :tomatoes,
:chocolate, :pollen, :cats]
allergen_hash = Hash.new
(0...allergens.length).to_a.each do |number|
  allergen_hash.store(2**number, allergens[number].to_s)
end


#Use the one argument to find the corresponding allergens
remaining_score = ARGV[0].to_i
allergen_list = []
allergen_hash.keys.reverse.each do |pointvalue|
  if(pointvalue <= remaining_score)
    allergen_list.push(allergen_hash[pointvalue])
    remaining_score -= pointvalue
  end
end


print(allergen_list)
