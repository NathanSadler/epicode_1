require('rock_paper_scissors')
require('rspec')

describe('RPS#wins?') do
  it("Returns true if rock is the first argument and scissors is the second") do
    game = RPS.new()
    expect(game.wins?("rock", "scissors")).to(eq(true))
  end

  it("returns true if paper is the first argument and rock is the second") do
    game = RPS.new()
    expect(game.wins?("paper", "rock")).to(eq(true))
  end

  it("returns true if scissors is the first argument and paper is the second") do
    game = RPS.new()
    expect(game.wins?("scissors", "paper")).to(eq(true))
  end

  it("returns false if scissors is the first argument and rock is the second") do
    game = RPS.new()
    expect(game.wins?("scissors", "rock")).to(eq(false))
  end

  it("returns false if rock is the first argument and paper is the second") do
    game = RPS.new()
    expect(game.wins?("rock", "paper")).to(eq(false))
  end

  it("returns false if paper is the first argument and scissors is the second") do
    game = RPS.new()
    expect(game.wins?("paper", "scissors")).to(eq(false))
  end

  it("returns false if both arguments are the same") do
    game = RPS.new()
    expect(game.wins?("paper", "paper")).to(eq(false))
  end

  it("increments the 'wins' section of the scoreboard if player 1 wins") do
    game = RPS.new()
    game.wins?("rock", "scissors")
    expect(game.scoreboard[:wins]).to(eq(1))
  end

  it("DOESNT increment the wins section of the scoreboard if player 1 loses or ties") do
    game = RPS.new()
    game.wins?("rock", "paper")
    game.wins?("paper", "paper")
    expect(game.scoreboard[:wins]).to(eq(0))
  end

  it("increments the losses section of the scoreboard if player 1 loses") do
    game = RPS.new()
    game.wins?("rock", "paper")
    expect(game.scoreboard[:losses]).to(eq(1))
  end

  it("DOESNT increment the losses section of the scoreboard if player one wins or draws") do
    game = RPS.new()
    game.wins?("paper", "rock")
    game.wins?("rock", "rock")
    expect(game.scoreboard[:losses]).to(eq(0))
  end

  it("increment the draws section of the scoreboard if the game ends in a tie") do
    game = RPS.new()
    game.wins?("paper", "paper")
    expect(game.scoreboard[:draws]).to(eq(1))
  end

  it("DOESNT increment the draws section of the scoreboard if either of the players win") do
    game = RPS.new()
    game.wins?("paper", "rock")
    game.wins?("rock", "paper")
    expect(game.scoreboard[:draws]).to(eq(0))
  end
end
