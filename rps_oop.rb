#rps.rb 
require 'pry'
module Hand
  include Comparable
  #attr_accessor :hand_throw
   CHOICES = {"R" =>'ROCK', "P" => 'PAPER', "S" =>'SCISSORS'}


  def <=>(other)
    if @hand_throw == other.hand_throw
      0
    elsif ((@hand_throw == 'PAPER' && other.hand_throw == 'ROCK') || (@hand_throw == 'ROCK' && other.hand_throw == 'SCISSORS') || (@hand_throw == 'SCISSORS' && other.hand_throw == 'PAPER'))
      1
    else
     -1
    end
       
  end
  
  #def compare_hands(p2)
  #  if @hand_throw == p2.hand_throw
  #    puts "It's a tie!"
  #  elsif (@hand_throw == 'PAPER' && p2.hand_throw == 'ROCK') || 
  #    (@hand_throw == 'ROCK' && p2.hand_throw == 'SCISSORS') || 
  #    (@hand_throw == 'SCISSORS' && p2.hand_throw == 'PAPER')
  #    puts "#{self.name} is the winner"
  #  else
  #    puts "#{p2.name} is the winner"
  #  end
  #end

  def compare_hands(p2)
    if self == p2
     puts "It's a tie!"
   elsif self > p2
     puts "#{self.name} wins!"
   else
     puts "#{p2.name} wins!"
   end
    # binding.pry  
  end
   def display_hand

    @hand_throw
     
   end

end
class Player
  require 'io/console'
  include Hand
  attr_accessor :name, :hand_throw

  def initialize(n)
    @name = n  
    @hand_throw = nil
  end

  def throw_hand()
    begin
      @hand_throw = CHOICES[STDIN.getch.upcase]
    end until CHOICES.has_value?(@hand_throw)

  end

  def random_hand

    @hand_throw = CHOICES.values.sample
    
  end

  def to_s
    "#{name} chose #{hand_throw}"
  end

end

class Game
  include Hand
  attr_accessor :player1, :player2
  def start
    puts "Welcome to Rock,Paper,Scissors"
    puts "Enter your name"
    name = gets.chomp
    
    player1 = Player.new(name)
    player2 = Player.new("Nemesis")
    while true
      game_intro
      
      player1.throw_hand
      player2.random_hand
      puts player1
      puts player2
      player1.compare_hands(player2)
      #binding.pry
      puts "\n"
      puts "Play Again? Y/N "
      play_again = STDIN.getch.upcase
    break if play_again == 'N'
  end
  end

  def game_intro
      puts "GET READY...."
      puts "Press (r)ock (p)aper or (s)cissors when it's time!"
      CHOICES.values.each do |gesture|
        print "#{gesture}"
        sleep 0.5
        print "........"
        sleep 0.5
      end
      puts "SHOOT!"
  end

end

Game.new.start

