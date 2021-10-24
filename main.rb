# GLOBAL VARIABLES HERE:

$player1_name = 'player1'
$player2_name = 'Computer'
$player1_score = 0
$player2_score = 0
$scores = { $player1_name.to_sym => $player1_score,
           $player2_name.to_sym => $player2_score}
$rps = ['Rock', 'Paper', 'Scissors']

# END OF GLOBAL VARIABLES

def setup
  puts "Hello and welcome to Ruby RPS! Player 1, Please enter your name"
  player_name = gets.chomp
  #scores[player_name.to_sym] = scores.delete :player1
  puts "Cool #{player_name}, you are going to play against the Computer"
end

def get_scores
  return $scores.each { |key, value| "#{key.to_s} your score is: #{value}"  }
end # end of setup method

def play(answer)
  until answer.downcase != "y"
    puts "#{$scores[:player1_name]}, I assume that you already know the rules ;)"
    puts "Let's go!"
    r = rand(3)
    computer_rps = $rps[r]
    puts "Please enter 'R' for Rock, 'P' for Paper or 'S' for Scissors:"
    player_rps = gets.chomp
    player_rps.upcase!
    case player_rps
    when "R"
      player_rps = "Rock"
    when "P"
      player_rps = "Paper"
    when "S"
      player_rps = "Scissors"
    else
      player_rps = "Error"
    end
    if player_rps != "Error"
      puts evaluate(player_rps, computer_rps)
      puts get_scores()
    else
      puts "Error! you have enter something else than R, P or S"
    end
    puts "Do you want to play again? y/Y or n/N"
    answer = gets.chomp
  end
  puts "Thank you, bye!"
end  #end of play method

def evaluate(player, computer)
  # `#{scores.key scores[:player1_name]} wins!`
  if player == computer
    return "It's a draw!"
  else
    if player == "Rock"
      if computer == "Paper"
        score = $scores[:player2_name].to_i
        score += 1
        $scores[:player2_name] = score
        return "Computer wins!"
      else
        score = $scores[:player1_name].to_i
        score += 1
        $scores[:player1_name] = score
        return "#{$scores.key $scores.fetch(:player1_name)} wins!"
      end
    elsif player == "Paper"
      if computer == "Scissors"
        score = $scores[:player2_name].to_i
        score += 1
        $scores[:player2_name] = score
        return "Computer wins!"
      else
        score = $scores[:player1_name].to_i
        score += 1
        $scores[:player1_name] = score
        return "#{$scores.key $scores.fetch(:player1_name)} wins!"
      end
    else
      if computer == "Rock"
        score = $scores[:player2_name].to_i
        score += 1
        $scores[:player2_name] = score
        return "Computer wins!"
      else
        score = $scores[:player1_name].to_i
        score += 1
        $scores[:player1_name] = score
        return "#{$scores.key $scores.fetch(:player1_name)} wins!"
      end
    end
  end
end # end of evaluate method

setup()

puts "Are you ready to play? type (y or Y) for yes AND n or N for no."
ready = gets.chomp
play(ready)
