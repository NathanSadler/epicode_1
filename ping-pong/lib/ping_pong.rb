require('pry')

def ping_pong(number)
  output = []
  (1..number).to_a.each do |value|
    if ((value % 3 == 0) && (value % 5 == 0))
      output.push("ping-pong")
    elsif (value % 5 == 0)
      output.push("pong")
    elsif (value % 3 == 0)
      output.push("ping")
    else
      output.push(value)
    end
  end
  output
end
