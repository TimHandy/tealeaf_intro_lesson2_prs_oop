# 1. have detailed requirements or specifications in written form
# 2. Extract major nouns -> classes
# 3. Extract major verbs -> instance methods
# 4. Group instance methods into classes


# 1. Paper Rock Scissors is a game for two players. Players pick a hand of either 'paper', 'rock', or 'scissors'. then the two hands are compared and it's either a tie (if hands are the same) or p < r, r > s, and s > p.
# 2. Player, Hand (Paper, Rock, Scissors)


class Hand
  include Comparable

  attr_reader :value

  def initialize(v)
    @value = v
  end

  def <=>(another_hand)
    if @value == another_hand.value
      0
    elsif (@value == 'p'  && another_hand.value == 'r') || (@value == 'r' && another_hand.value == 's') || (@value == 's' && another_hand.value == 'p')
      1
    else
      -1
    end
  end

  def display_winning_message
    case @value
    when 'p' 
      puts "paper wraps rock"
    when 'r'
      puts "rock smashes scissors"
    when 's'
      puts "scissors cuts paper"
    end
  end
      
end


class Player


  attr_accessor :hand
  attr_reader :name

  def initialize(n)
    @name = n
  end

  def to_s
    "#{name} currently has a choice of #{self.hand.value}!"
  end

end

class Human < Player
  def pick_hand
    begin
      puts "Pick one: (p, r, s):"
      c = gets.chomp.downcase
    end until Game::CHOICES.keys.include?(c)

    self.hand = Hand.new(c)
  end
end

class Computer < Player
  def pick_hand
    self.hand = Hand.new(Game::CHOICES.keys.sample)
  end
end



class Game
  CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}

  attr_reader :player, :computer

  def initialize
    @player = Human.new("Bob")
    @computer = Computer.new("R2D2")
  end

  def compare_hands
    if player.hand == computer.hand
      player.hand.display_winning_message
      puts "It's a tie!"
    elsif player.hand > computer.hand
      puts "#{player.name} won!"
    else 
      computer.hand.display_winning_message
      puts "#{computer.name} won!"
    end
  end

  def play
    player.pick_hand
    computer.pick_hand
    compare_hands   

    puts player
    puts computer

  end

end


game = Game.new.play








































# class Hand
#   include Comparable

#   attr_reader :value

#   def initialize(v)
#     @value = v
#   end

#   def <=>(another_hand)
#     if @value == another_hand.value
#       0
#     elsif (@value == 'p' && another_hand.value == 'r') || (@value == 'r' && another_hand.value == 's') || (@value =='s' && another_hand.value == 'p')
#       1
#     else
#       -1
#     end
#   end
      
# end


# class Player
  
#   attr_accessor :hand
#   attr_reader :name

#   def initialize(n)
#     @name = n
#   end

#   def to_s
#     "#{name} currently has a choice of #{c}!"
#   end

# end

# class Human < Player
#   def pick_hand
#     begin
#       # get user choice
#       print "what's your choice? (r/p/s): "
#       c = gets.chomp.downcase
#     end until Game::CHOICES.keys.include?(c)

#     self.hand = Hand.new(c)
#   end
# end

# class Computer < Player
#   def pick_hand
#     self.hand = Hand.new(Game::CHOICES.keys.sample)
#   end
# end

# class Game
#   attr_reader :player, :computer
#   CHOICES = { 'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}

#   def initialize
#     @player = Human.new("Bob")
#     @computer = Computer.new("R2D2")
#   end

#   def compare_hands
#     if player.hand == computer.hand
#       puts "It's a tie"
#     elsif player.hand > computer.hand
#       puts "#{player.name} won!"
#     else
#       puts "#{computer.name} won!"
#     end

#   end

#   def play
#     player.pick_hand
#     computer.pick_hand
#     compare_hands
    
#     puts player
#     puts computer
#   end
# end


# game = Game.new.play
