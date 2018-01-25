class Board

  attr_accessor :case_num, :case_value

  def initialize #On initialise la classe Board avec un Hash (case_num, aux valeurs case_value) qui nous permet de nous représenter notre plateau de jeu. Les lettres en abscisse les chiffres en ordonnée
    @case_num={"A1" => BoardCase.new,#initialement BoardCase n'a qu'une seule instance : case_value = " ",
      "A2" => BoardCase.new,#Pourquoi ? Parceque le tableau doit être vierge au début(like the very first time, feel your heart beats next to mine, wouhouhou), et qu'un espace rend un meilleur rendu graphique
      "A3" => BoardCase.new,
      "B1" => BoardCase.new,
      "B2" => BoardCase.new,
      "B3" => BoardCase.new,
      "C1" => BoardCase.new,
      "C2" => BoardCase.new,
      "C3" => BoardCase.new
      }
  end

  def show_board#show_board est la méthode qui va nous permettre de visualiser le plateau de jeu. On le rempli grace au Hash case_num qui pour chaque case renvoi la valeur associée
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

  def put_X#c'est la méthode pour mettre un X
    @case_value = "X"
  end

  def put_O#c'est la méthode pour mettre un O, t'y a compris???
    @case_value = "O"
  end

end


class Player

  attr_accessor :player_name

  def initialize
    puts "What's your name ?"#Ici on initialise la classe player par une question , quel est son prénom et on l'enregistre en instance
    @player_name = gets.chomp
  end


class Game#The big class

attr_accessor :player_1, :player_2, :set, :round

  def initialize#La class Game c'est un peu la master class du programme, du coup il y a deux, trois trucs a y coler pour pouvoir orchestré l'ensemble
    @player_1 = Player.new#On crée le joueur 1, Donc ça va poser la question "What's your name ?" et conserver la réponse en player_name pour le player_1
    @player_2 = Player.new#on remet la petite soeur !
    @set = Board.new #Création d'un plateau, tout nouveau tout beau
    @round = 2#par la suite on va avoir besoin de savoir à quel tour on se situe pour pouvoir savoir qui est en train de jouer. player_1 round pair (round%2==0), player_2 round impair (round%2!=0)
    @choice = " "#ici il s'agit des réponses qui vont êtres données par les joueur, et vont nous permettre de modifier le Hash case_num
  end

  def play#C'est la méthode qui va nous permettre de récolter les coups des joueurs
    puts "what case do you want to play (for exemple, first column first line : A1) ?"
    @choice = gets.chomp
    @choice.capitalize!#les Keys de case_num sont en majuscules (ex: "A3"), et ça doit être respecté !
      if @set.case_num[@choice].case_value != " "#on s'assure que personne ne triche en modifiant une case déjà jouéee
        puts "Look ! Please choose another case, this one has already been checked"
        self.play#et si c'est le cas, on le refait jouer
      elsif @round%2==0
        @set.case_num[@choice].put_X#On est en round pair, c'est le player_1 qui joue, et le player_1 prend les X, c'est comme ça et pis c'est tout
      elsif @round%2!=0
        @set.case_num[@choice].put_O#même logique, les O c'est pour le player_2
      end

    @round+=1#On ajoute un round, après le coup de chaque joueur
  end

  def row_check#pour savoir si quelqu'un a gagné on check les combinaison en ligne, et surtout on s'assure qu'elles ne sont pas égales à " " sinon on va pas bien loin puisque dès le départ toutes les cases le sont.....
      if (@set.case_num["A1"].case_value == @set.case_num["B1"].case_value && @set.case_num["B1"].case_value == @set.case_num["C1"].case_value && @set.case_num["A1"].case_value !=" ") ||
          (@set.case_num["A2"].case_value == @set.case_num["B2"].case_value && @set.case_num["B2"].case_value == @set.case_num["C2"].case_value && @set.case_num["A2"].case_value !=" ") ||
          (@set.case_num["A3"].case_value == @set.case_num["B3"].case_value && @set.case_num["B3"].case_value == @set.case_num["C3"].case_value && @set.case_num["A3"].case_value !=" ")
        return true
      else
        return false
      end
  end

  def column_check#on remet la petite soeur pour les colonnes...
      if (@set.case_num["A1"].case_value == @set.case_num["A2"].case_value && @set.case_num["A2"].case_value == @set.case_num["A3"].case_value && @set.case_num["A1"].case_value !=" ") ||
            (@set.case_num["B1"].case_value == @set.case_num["B2"].case_value && @set.case_num["B2"].case_value == @set.case_num["B3"].case_value && @set.case_num["B1"].case_value !=" ") ||
            (@set.case_num["C1"].case_value == @set.case_num["C2"].case_value && @set.case_num["C2"].case_value == @set.case_num["C3"].case_value && @set.case_num["C1"].case_value !=" ")

         return true
      else
        return false
      end
  end

  def diag_check#la même toujours ! et ici ça part à dorz !
    if @set.case_num["A1"].case_value == @set.case_num["B2"].case_value && @set.case_num["B2"].case_value == @set.case_num["C3"].case_value && @set.case_num["A1"].case_value!=" "
      return true
    elsif @set.case_num["A3"].case_value == @set.case_num["B2"].case_value && @set.case_num["B2"].case_value == @set.case_num["C1"].case_value && @set.case_num["A3"].case_value!=" "
        return true
    else
      return false
    end
  end

  def victory #bon, on a un winner avec nous ou bien ?
    if row_check || diag_check || column_check
      return true
    else
      return false
    end
  end

  def where_are_we#Cette méthode c'est pour savoir à quel tour on se situe dans la partie, et surtout à c'est le tour !

    if @round%2==0
      puts "we're now playing round #{@round/2}, #{player_1.player_name} your turn"#Pourquoi #{@round/2} me direz-vous ?
      puts @set.show_board                                                         #et bien parcequ'ici on repère qui joue en fonction de si @round est pair ou impair, et on ajoute 1 à round après le coup de chaque joueur.
    elsif                                                                          #Sauf qu'on fait un tour qu'après que les deux joueurs aient joué, mais si @round=7 c'est player_2 qui joue et on en est au tour 3, car 7/2 = 3.5 et que Ruby arrondi à la décimale inférieure donc à 3
        @round%2!=0
        puts "we're now playing round #{@round/2}, #{player_2.player_name} your turn"
        puts @set.show_board
    end
  end

  def game_ending #ça c'est méthode qui check si on a un winner et qui le cite bien fort !!!
    if victory && @round%2==0
      puts "#{player_2.player_name} you win at round #{@round/2} !!!"#Un petit hophophop pour le gagnant
      puts @set.show_board
    else victory && @round%2!=0
      puts "#{player_1.player_name} you win at round #{@round/2}!!!"
      puts @set.show_board#Rappel du Board pour qu'on puisse voir sa défaite
    end
  end
end

game=Game.new #lancement du jeu, donc de game, donc deux de player, donc deux question, un plateau tout nouveau, etc....

count = 0.0
while count < 5.0 #bon là je me suis lamentablement craqué, l'idée c'était de pouvoir afficher un match nul lorsque toutes les cases ont été remplies
   if game.victory != true
     game.where_are_we
     game.play
   elsif game.victory == true
      game.game_ending
      count = 5.0
    elsif count == 4.0
      puts "Draw ! Game Over !"
    end
  count+=0.5
  end
end
