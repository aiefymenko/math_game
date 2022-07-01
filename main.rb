require_relative "player.rb"

p1 = Player.new("Player 1")
p2 = Player.new("Player 2")
who_boolean = true

while (p1.lives > 0 && p2.lives > 0)
  puts "----- NEW TURN -----"
  if (who_boolean)
    who = p1
  else
    who = p2
  end
  who_boolean = !(who_boolean)

  num1 = 1 + rand(20)
  num2 = 1 + rand(20)
  operation = rand(2)
  ans = 0

  if (operation == 0)
    puts "#{who.name}: What does #{num1} plus #{num2} equal?"
    ans = num1 + num2
  elsif (operation == 1)
    puts "#{who.name}: What does #{num1} minus #{num2} equal?"
    ans = num1 - num2
  end

  player_ans = gets.chomp.to_i
  # puts player_ans
  if (player_ans == ans)
    who.increaseScore
    puts "Correct!"
  else
    who.loseLife
    puts "Wrong answer!"
  end

  puts "P1: Score - #{p1.score}, Lives: #{p1.lives}"
  puts "P2: Score - #{p2.score}, Lives: #{p2.lives}"

end

puts "----- GAME OVER -----"

if (p1.lives == 0)
  score_difference = p2.score - p1.score
  winner = "Player 2"
else
  score_difference = p1.score - p2.score
  winner = "Player 1"
end

puts "#{winner} wins with #{score_difference}"


def printNewTurn()
  puts "== NEW TURN =="
end