class Array
  def queen_attack?(pos)
    # True if queen can attack horizontally
    if (self[0] == pos[0])
      true
    # True if queen can attack vertically
    elsif (self[1] == pos[1])
      true
    # True if queen can attack diagonally
    elsif((self[0] - pos[0]) == (self[1] - pos[1]))
      true
    else
      false
    end
  end
end
