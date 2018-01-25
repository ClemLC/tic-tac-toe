require 'pry'

class Board

  attr_accessor :case_num, :case_value

  def initialize
    @case_num={"A1" => BoardCase.new,
      "A2" => BoardCase.new,
      "A3" => BoardCase.new,
      "B1" => BoardCase.new,
      "B2" => BoardCase.new,
      "B3" => BoardCase.new,
      "C1" => BoardCase.new,
      "C2" => BoardCase.new,
      "C3" => BoardCase.new
      }
  end

  def show_board
    puts "  A B C"
    puts " -------"
    puts "1|#{@case_num["A1"].case_value}|#{@case_num["B1"].case_value}|#{@case_num["C1"].case_value}|"
    puts " -------"
    puts "2|#{@case_num["A2"].case_value}|#{@case_num["B2"].case_value}|#{@case_num["C2"].case_value}|"
    puts " -------"
    puts "3|#{@case_num["A3"].case_value}|#{@case_num["B3"].case_value}|#{@case_num["C3"].case_value}|"
    puts " -------"
 end

end

class BoardCase
attr_accessor :case_value

  def initialize
    @case_value = " "
  end

  def put_X
    @case_value = "X"
  end

  def put_O
    @case_value = "O"
  end
  
end


class Player

  attr_accessor :player_name, :player_state

  def initialize
    puts "What's your name (X or O, letters only) ?"
    @player_name = gets.chomp
    @player_state = " "
  end


class Game

  def initialize
    @player_1 = Player.new
    @player_2 = Player.new
    @Board = Board.new
  end

# $tour=(2)

  def play
    puts "what case do you want to play ?"
    choice = gets.chomp
    choice.capitalize
    @case_num.each { |hash, key| @case_num[choice] = @player_name }
    @Board.show_board
  end

  def round
    @player_1.play
    @player_2.play
    @player_1.play
    @player_2.play
    @player_1.play
    @player_2.play
    @player_1.play
    @player_2.play
    @player_1.play
  end

end

game = Game.new

game.round

end


# def victory
# @player_state = "Winner" if
#   @case_num["A1"].case_value == @case_num["A2"].case_value && @case_num["A2"].case_value == @case_num["A3"].case_value ||#colonne A
#   @case_num["B1"].case_value == @case_num["B2"].case_value && @case_num["B2"].case_value == @case_num["B3"].case_value ||#colonne B
#   @case_num["C1"].case_value == @case_num["C2"].case_value && @case_num["C2"].case_value == @case_num["C3"].case_value ||#colonne C
#   @case_num["A1"].case_value == @case_num["B1"].case_value && @case_num["B1"].case_value == @case_num["C1"].case_value ||#ligne 1
#   @case_num["A2"].case_value == @case_num["B2"].case_value && @case_num["B2"].case_value == @case_num["C2"].case_value ||#ligne 2
#   @case_num["A3"].case_value == @case_num["B3"].case_value && @case_num["B3"].case_value == @case_num["C3"].case_value ||#ligne 3
#   @case_num["A1"].case_value == @case_num["B2"].case_value && @case_num["B2"].case_value == @case_num["C3"].case_value ||#diagonale
#   @case_num["A3"].case_value == @case_num["B2"].case_value && @case_num["B2"].case_value == @case_num["C1"].case_value   #diagonale
#   unless @case_num["A1"].case_value && @case_num["B2"].case_value && @case_num["C1"].case_value != " "
#   end
# end
