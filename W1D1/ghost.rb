class Game
  attr_accessor :current_player, :previous_player, :players, :fragment, :dictionary

  def initialize(players, fragment, dictionary)
    @current_player = players[:player_one]
    @previous_player = players[:player_two]
    @players = players
    @fragment = fragment
    @dictionary = dictionary
  end

  def next_player!
    @current_player = @current_player == players[:player_one] ?
    players[:player_two] : players[:player_one]
    @previous_player = @previous_player == players[:player_one] ?
    players[:player_two] : players[:player_one]
  end

  def take_turn(player)
    puts "Give a letter"
    letter = gets.chomp
    while valid_play?(letter) == false
      puts "Give a letter"
      letter = gets.chomp
    end
    @fragment += letter
    "You lose!" if @dictionary.includes?(@fragment)
  end

  def valid_play?(string)
    alphabet = ("a".."z").to_a
    return true if (alphabet.include?(string) && !@dictionary.include?(@fragment + string + "\n"))
    false
  end

end


game = Game.new({player_one: "Joyce", player_two: "Dong"}, "abac", File.readlines("dictionary.txt"))

puts game.valid_play?("x")
puts game.valid_play?("i")
puts game.dictionary.include?("abaci\n")
