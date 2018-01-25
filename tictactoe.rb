class Board

	attr_accessor 	:game_grid 
	# On crée un tableau avec des cases et leurs numéro correspondant.
	def initialize
		@case1 = BoardCase.new(1)
		@case2 = BoardCase.new(2)
		@case3 = BoardCase.new(3)
		@case4 = BoardCase.new(4)
		@case5 = BoardCase.new(5)
		@case6 = BoardCase.new(6)
		@case7 = BoardCase.new(7)
		@case8 = BoardCase.new(8)
		@case9 = BoardCase.new(9)
		@game_grid = [@case1.value, @case2.value, @case3.value, @case4.value, @case5.value, @case6.value, @case7.value, @case8.value, @case9.value]
	end

	def play(player)
		if @game_grid.include? " "		# <= Vérifie si il y'a au moin une case vide.
			input = gets.chomp.to_i
			if (@game_grid[input - 1] === " ")		# <= Vérifie si la case est vide.
				@game_grid[input - 1] = player.value		# <= Place le signe du jour 
				victory(player)		# Vérifie si le jouer a gagner.
			else
				puts "Case occupé, choisissez une case vide svp"
				play(player)
			end
		else 
			puts "MATCH NULLLLLLLLL"		# <= Renvoi "match nul" si aucune case n'est libre et aucun joueur victorieux.
			exit
		end

	end

	def display		# <= Gère l'affichage de la grille, permet d'afficher au fomat 3x3 les case au lieu d'une seule ligne.

		@game_grid[0..2].each do |valeur| 
			print "|" + valeur + " "
		end
		print "|"		# <= Lignes pour mise en forme du tableau.
		print "\n"
		print "----------"
		print "\n"
		@game_grid[3..5].each do |valeur|
			print "|" + valeur + " "
		end
		print "|"
		print "\n"
		print "----------"
		print "\n"
		@game_grid[6..8].each do |valeur|
			print "|" + valeur + " "
		end
		print "|"
		print "\n"
		puts " "
		
	end
	# Vérifie si le joueur envoyé en paramètre a une ligne de symbol identique
	def victory(player)
		if (game_grid[0] == player.value) && (game_grid[1] == player.value) && (game_grid[2] == player.value)
			puts "#{player.name} a gagné la partie."
			display		# <= Pour réaficher le tableau.
			exit		# <= Pour quitté le jeu si la condition est vrai et qu'un joueur a gagné
			
		elsif (game_grid[3] == player.value) && (game_grid[4] == player.value) && (game_grid[5] == player.value)
			puts "#{player.name} a gagné la partie."
			display
			exit
			
		elsif (game_grid[0] == player.value) && (game_grid[4] == player.value) && (game_grid[8] == player.value)
			puts "#{player.name} a gagné la partie."
			display
			exit
			
		elsif (game_grid[2] == player.value) && (game_grid[4] == player.value) && (game_grid[6] == player.value)
			puts "#{player.name} a gagné la partie."
			display
			exit
			
		elsif (game_grid[0] == player.value) && (game_grid[3] == player.value) && (game_grid[6] == player.value)
			puts "#{player.name} a gagné la partie."
			display
			exit
			
		elsif (game_grid[1] == player.value) && (game_grid[4] == player.value) && (game_grid[7] == player.value)
			puts "#{player.name} a gagné la partie."
			display
			exit
			
		elsif (game_grid[2] == player.value) && (game_grid[5] == player.value) && (game_grid[8] == player.value)
			puts "#{player.name} a gagné la partie."
			display
			exit
		else
			return
		end
	end

end

class BoardCase
	attr_accessor :value, :case_number

	def initialize(case_number)
		@value = " "
		@case_number = case_number
	end

end

class Player
	attr_accessor :name, :value
	attr_writer :he_won

	def initialize(name, value)		# <= Initilaise les joueurs.
		@name = name
		@value = value
	end

end

class Game
	attr_accessor :player

	def initialize		# <= Initialise la partie.
		@player = player
		puts "Bienvenue dans TicTacToe (morpion), appuyé sur \"ENTRER\" pour commencer"
		puts "Joueur 1 entré votre nom svp"
		joueur1 = gets.chomp.capitalize!
		puts "Joueur 2 entré votre nom svp"
		joueur2 = gets.chomp.capitalize!
		@player1 = Player.new(joueur1, "X")
		@player2 = Player.new(joueur2, "O")
		@new_board = Board.new
	end

	def go
		turn
	end

	def turn
		while (true)		# <= Continu le jeu tant que les conditions d'arret plus haut dans le code ne sont pas respecter.
			@new_board.display
			puts "#{@player1.name} quelle case voulez vous jouez(choisissé un nombre entre 1 et 9)?"
			@new_board.play(@player1)
			@new_board.display
			puts "#{@player2.name} quelle case voulez vous jouez(choisissé un nombre entre 1 et 9)?"
			@new_board.play(@player2)
		end
	end

end

Game.new.go		# <= On lance le jeu en appelant la methode initialise(avec .new) de la classe Game puis la méthode go qui lance la partie.
