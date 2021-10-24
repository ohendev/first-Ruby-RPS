# GLOBAL VARIABLES HERE:

player1_name = 'player1'
player2_name = 'Computer'
player1_score = 0
player2_score = 0
scores = { player1_name.to_sym => player1_score,
           player2_name.to_sym => player2_score}
rps = ['Rock', 'Paper', 'Scissors']

# END OF GLOBALM VARIABLES

def setup
  puts "Hello and welcome to Ruby RPS! Player 1, Please enter your name"
  player_name = gets.chomp
  puts `Cool #{player_name}, you're going to play against the Computer`
  scores[player_name.to_sym] = scores.delete :player1
end

def get_scores
  return `#{scores} your score is: #{player1_score} and #{player2_name} your score is: #{player2_score}.`
end # end of setup method

def play(answer)
  until answer.downcase != "no"
    puts `#{player1_name}, I assume that you already know the rules ;)`
    puts "Let's go!"
    computer_rps = rps[Random.new(3)]
    puts "Please enter 'R' for Rock, 'P' for Paper or 'S' for Scissors:"
    player_rps = gets.chomp
    evaluate(player_rps, computer_rps)
  end
end  #end of play method

def evaluate(player, computer)
end # end of evaluate method
