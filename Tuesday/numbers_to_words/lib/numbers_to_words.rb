require('pry')
class Integer
  def numbers_to_words
    ones_hash = places_hasher([:one, :two, :three, :four, :five, :six,
      :seven, :eight, :nine, :ten], (1..9).to_a)

    ten_values = (1..9).to_a.map{|value| value * 10}
    tens_hash = places_hasher([:ten, :twenty, :thirty, :fourty, :fifty, :sixty,
      :seventy, :eighty, :ninety], values=ten_values, modifier=10)

    hundreds_hash = places_hasher(['one hundred', 'two hundred', 'three hundred',
    'four hundred', 'five hundred', 'six hundred', 'seven hundred', 'eight hundred',
  'nine hundred'], values=(1..9).to_a.map{|value| value * 100}, modifier=100)

    modifier_hash = {1000 => 'thousand', 1000000 => 'million',
    1000000000 => 'billion' }

    teens_hash = {1 => 'eleven', 2 => 'twelve', 3 => 'thirteen',
    4 => 'fourteen', 5 => 'fifteen', 6 => 'sixteen', 7 => 'seventeen',
  8 => 'eighteen', 9 => 'nineteen'}

    master_hash = ones_hash.merge(tens_hash).merge(hundreds_hash)


    digit_array = self.digits.reverse
    modifier = 10 ** (digit_array.length - 1)
    written_number = ""
    iter_counter = 0
    digit_array.each do |number|
      if number != 0
        # If a 10.000, 10.000.000, or 10.000.000.000, use the values from the
        # tens hash
        if (modifier == 10**4 || modifier == 10 ** 7 || modifier == 10 ** 10)
          written_number += master_hash.fetch(number * 10)
        # If a 100.000, 100.000.000, or 100.000.000.000, use values from the
        # hundreds hash
        elsif (modifier==10**5 || modifier==10**8 || modifier==10**11)
            written_number += master_hash.fetch(number * 100)
        # If a 1.000, 1.000.000, or 1.000.000.000, use the values from the
        # ones hash
        elsif (modifier==10**3 || modifier==10**6 || modifier==10**9)
          written_number += master_hash.fetch(number)
        else
          written_number += master_hash.fetch(number * modifier)
        end
      end

      # If the previous digit was in an tens place AND there was a 1 there,
      # remove whatever was just added and the last 'ten' from written_number,
      # and replace it with whatever number in the teens (or 11/12) as neccessary
      if ((modifier==1 || modifier==10**3 || modifier==10**6 || modifier==10**9) &&
      digit_array[iter_counter - 1] == 1 && iter_counter > 0)
          erase_start = written_number.match(/\w+\s\w+\z/).begin(0)
          written_number = written_number[0, erase_start]
          written_number += teens_hash.fetch(number)
      end

      # Add 'thousand', 'million', or 'billion' if neccessary
      if (modifier_hash[modifier] && written_number.strip != "")
        written_number += " "
        written_number += modifier_hash[modifier]
      end
      modifier = modifier / 10
      iter_counter += 1
      written_number += " "
    end
    written_number.strip
  end
end

def places_hasher(word_forms, values=(1..9).to_a, modifier=1)
  new_hash = Hash.new
  values.map {|number| new_hash.store(number, word_forms[(number / modifier) - 1].to_s)}
  new_hash
end
