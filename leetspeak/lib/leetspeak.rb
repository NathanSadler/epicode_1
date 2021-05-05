require('pry')

class String
  def leetspeak
    leet_phrase = []
    self.split('').each do |letter|
      if (letter == 'e')
        leet_phrase.append('3')
      elsif (letter == 'o')
        leet_phrase.append('0')
      elsif (letter == 'I')
        leet_phrase.append('1')
      elsif (letter == 's')
        if (leet_phrase.length == 0 || leet_phrase[-1] == ' ')
          leet_phrase.append('s')
        else
          leet_phrase.append('z')
        end
      else
        leet_phrase.append(letter)
      end
    end
    foo = leet_phrase.join
  end

end
