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
    @case_value = " " #Dès le début de la partie les cases sont vides
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

  def initialize(player_name, player_state)
    puts "What's your name ?"
    @player_name = gets.chomp
    @player_state = " "
  end


class Game

attr_accessor :player_1, :player_2, :set, :round

  def initialize(name_player_1, name_player_2)
    @player_1 = Player.new(name_player_1)
    @player_2 = Player.new(name_player_2)
    @set = Board.new
    @round = 2
    @choice = " "
  end

  def play
    puts "what case do you want to play (for exemple, first column first line : A1) ?"
    @choice = gets.chomp
    @choice.capitalize
      if @set.case_num[@choice].case_value != " "
        puts "Look ! Please choose another case, this one has already been checked"
        self.play
      elsif @round%2==0
        @set.case_num[@choice].put_X
      elsif @round%2!=0
        @set.case_num[@choice].put_O
      end

    @round+=1
  end

  def victory

    if @case_num["A1"].case_value && @case_num["B2"].case_value && @case_num["C1"].case_value != " "
      if
        @case_num["A1"].case_value == @case_num["A2"].case_value && @case_num["A2"].case_value == @case_num["A3"].case_value ||#colonne A
        @case_num["B1"].case_value == @case_num["B2"].case_value && @case_num["B2"].case_value == @case_num["B3"].case_value ||#colonne B
        @case_num["C1"].case_value == @case_num["C2"].case_value && @case_num["C2"].case_value == @case_num["C3"].case_value ||#colonne C
        @case_num["A1"].case_value == @case_num["B1"].case_value && @case_num["B1"].case_value == @case_num["C1"].case_value ||#ligne 1
        @case_num["A2"].case_value == @case_num["B2"].case_value && @case_num["B2"].case_value == @case_num["C2"].case_value ||#ligne 2
        @case_num["A3"].case_value == @case_num["B3"].case_value && @case_num["B3"].case_value == @case_num["C3"].case_value ||#ligne 3
        @case_num["A1"].case_value == @case_num["B2"].case_value && @case_num["B2"].case_value == @case_num["C3"].case_value ||#diagonale
        @case_num["A3"].case_value == @case_num["B2"].case_value && @case_num["B2"].case_value == @case_num["C1"].case_value   #diagonale
        return true
      end
    return false
    end
  end


  def where_are_we
  puts "we're now playing round #{@round}/2"
if victory && @round = 2%==0
  puts



end

game = Game.new

game.round

end
