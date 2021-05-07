class Word < String

  def initialize(word)
    super(word)
    # Creates the scoring system
    @score_system = Hash.new()
    score_system_helper(@score_system, [:a, :e, :i, :o, :u, :l, :n, :r, :s, :t], 1)
    score_system_helper(@score_system, [:d, :g], 2)
    score_system_helper(@score_system, [:b, :c, :m, :p], 3)
    score_system_helper(@score_system, [:f, :h, :v, :w, :y], 4)
    @score_system.store("K", 5)
    score_system_helper(@score_system, [:j, :x], 8)
    score_system_helper(@score_system, [:q, :z], 10)
  end

  def scrabble(word=self)
    score_total = 0
    self.upcase.split('').each do |letter|
      score_total += get_letter_score(letter)
    end
    score_total
  end

  def get_letter_score(letter)
    return @score_system.fetch(letter)
  end

end

class Sentence < Word
  def initialize(word)
    super(word)
  end

  def scrabble
    score_total = 0
    nospace = self.upcase.split('').select {|n| n!=" "}
    nospace.reduce(0) {|total, n| total += get_letter_score(n)}
  end
end

def score_system_helper(score_system, char_list, value)
  char_list.map {|letter| score_system.store(letter.to_s.upcase, value)}
  score_system
end
