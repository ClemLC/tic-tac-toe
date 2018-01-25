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

  attr_accessor :player_name

  def initialize
    puts "What's your name ?"
    @player_name = gets.chomp
  end


class Game

attr_accessor :player_1, :player_2, :set, :round

  def initialize
    @player_1 = Player.new
    @player_2 = Player.new
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

  def verifyrow
      if (@case_num["A1"].case_value == @case_num["B1"].case_value && @case_num["B1"].case_value == @case_num["C1"].case_value && @case_num["A1"].case_value =" ") ||
          (@case_num["A2"].case_value == @case_num["B2"].case_value && @case_num["B2"].case_value == @case_num["C2"].case_value && @case_num["A2"].case_value =" ") ||
          (@case_num["A1"].case_value == @case_num["B3"].case_value && @case_num["B3"].case_value == @case_num["C3"].case_value && @case_num["A3"].case_value =" ")
        return true
      else
        return false
      end
  end

  def verifycolumn
      if (@case_num["A1"].case_value == @case_num["A2"].case_value && @case_num["A2"].case_value == @case_num["A3"].case_value && @case_num["A1"].case_value =" ") ||
            (@case_num["B1"].case_value == @case_num["B2"].case_value && @case_num["B2"].case_value == @case_num["B3"].case_value && @case_num["B1"].case_value =" ") ||
            (@case_num["C1"].case_value == @case_num["C2"].case_value && @case_num["C2"].case_value == @case_num["C3"].case_value && @case_num["C1"].case_value =" ")

         return true
      else
        return false
      end
  end

  def verifydiag
    if @case_num["A1"].case_value == @case_num["B2"].case_value && @case_num["B2"].case_value == @case_num["C3"].case_value && @partie.table["B2"].value!=" "
      return true
    elsif (@case_num["A3"].case_value == @case_num["B2"].case_value && @case_num["B2"].case_value == @case_num["C1"].case_value && @partie.table["B2"].value!=" "
          return true
    else
      return false
    end
  end

  def victory
    if verifyrow || verifydiag || verifycolumn
      return true
    else
      return false
    end
  end

    # if (@case_num["A1"].case_value != " " && @case_num["B2"].case_value != " " && @case_num["C3"].case_value != " ")
    #   return false
    # else
    #     (@case_num["A1"].case_value == @case_num["A2"].case_value && @case_num["A2"].case_value == @case_num["A3"].case_value) ||#colonne A
    #     (@case_num["B1"].case_value == @case_num["B2"].case_value && @case_num["B2"].case_value == @case_num["B3"].case_value) ||#colonne B
    #     (@case_num["C1"].case_value == @case_num["C2"].case_value && @case_num["C2"].case_value == @case_num["C3"].case_value) ||#colonne C
    #     (@case_num["A1"].case_value == @case_num["B1"].case_value && @case_num["B1"].case_value == @case_num["C1"].case_value) ||#ligne 1
    #     (@case_num["A2"].case_value == @case_num["B2"].case_value && @case_num["B2"].case_value == @case_num["C2"].case_value)||#ligne 2
    #     (@case_num["A3"].case_value == @case_num["B3"].case_value && @case_num["B3"].case_value == @case_num["C3"].case_value)||#ligne 3
    #     (@case_num["A1"].case_value == @case_num["B2"].case_value && @case_num["B2"].case_value == @case_num["C3"].case_value)||#diagonale
    #     (@case_num["A3"].case_value == @case_num["B2"].case_value && @case_num["B2"].case_value == @case_num["C1"].case_value)   #diagonale
    #     return true
    # end
  # end


  def where_are_we

    if @round%2!=0
      puts "we're now playing round #{@round/2}, #{player_1.player_name} your turn"
      puts @set.show_board
      elsif
        @round%2==0
        puts "we're now playing round #{@round/2}, #{player_2.player_name} your turn"
        puts @set.show_board
    else
      if victory && @round%2==0
        puts "#{player_2.name_player_2} you win !!!"
        puts @set.show_board
      elsif victory && @round%2!=0
        puts "#{player_1.name_player_1} you win !!!"
        puts @set.show_board
      end
    end
end

game=Game.new

9.times do
  game.where_are_we
  break if game.victory==true
  game.play
end
    if game.victory=true
      puts "Match nul !"
    end
  end
end
