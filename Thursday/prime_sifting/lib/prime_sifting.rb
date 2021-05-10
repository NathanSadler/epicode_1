require('pry')
class Integer
  def listfromtwo
    return (2..self).to_a
  end

  def remove_multiples(number_list)
    number_list.reject {|i| self % i == 0}
  end

  def prime_sifting
    number_list = self.listfromtwo
    prime_index = 0
    prime = number_list[prime_index]

    while prime != number_list[-1]
      copy = number_list[prime_index..-1].reject {|i| i % prime == 0}
      prime_index += 1
      prime = number_list[prime_index]
      number_list = number_list[0...prime_index] + copy[0..-1]
    end

    number_list

  end
end
