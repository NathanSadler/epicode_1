class RPS
  attr_reader(:scoreboard)

  def initialize
    @scoreboard = {:wins => 0, :losses => 0, :draws => 0}
  end

  def wins?(player_1, player_2)
    rps_triangle = {"rock" => "scissors", "paper" => "rock",
    "scissors" => "paper"}
    if rps_triangle.fetch(player_1) == player_2
      scoreboard[:wins] += 1
      true
    else
      if player_1 != player_2
        scoreboard[:losses] += 1
      else
        scoreboard[:draws] += 1
      end
      false
    end
  end
end
