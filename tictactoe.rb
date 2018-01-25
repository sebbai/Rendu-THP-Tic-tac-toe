class Board
	include Enumerable

	attr_accessor 	:game_grid #["@a1", "@a2","@a3","@a4","@a5","@a6","@a7","@a8","@a9",]

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
		
		input = gets.chomp.to_i
		if (@game_grid[input - 1] === " ")
			@game_grid[input - 1] = player.value

			victory(player)
		else
			puts "Case occupé, choisissez une case vide svp"
			play(player)
		end

	end

	def display
		@game_grid[0..2].each do |valeur|
			print "|" + valeur + " "
		end
		print "|"
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

	def victory(player)
		if (game_grid[0] == player.value) && (game_grid[1] == player.value) && (game_grid[2] == player.value)
			puts "#{player.name} à gagner la parti."
			exit
			display
		elsif (game_grid[3] == player.value) && (game_grid[4] == player.value) && (game_grid[5] == player.value)
			puts "#{player.name} à gagner la parti."
			exit
			display
		elsif (game_grid[0] == player.value) && (game_grid[4] == player.value) && (game_grid[8] == player.value)
			puts "#{player.name} à gagner la parti."
			exit
			display
		elsif (game_grid[2] == player.value) && (game_grid[4] == player.value) && (game_grid[6] == player.value)
			puts "#{player.name} à gagner la parti."
			exit
			display
		elsif (game_grid[0] == player.value) && (game_grid[3] == player.value) && (game_grid[6] == player.value)
			puts "#{player.name} à gagner la parti."
			exit
			display
		elsif (game_grid[1] == player.value) && (game_grid[4] == player.value) && (game_grid[7] == player.value)
			puts "#{player.name} à gagner la parti."
			exit
			display
		elsif (game_grid[2] == player.value) && (game_grid[5] == player.value) && (game_grid[8] == player.value)
			puts "#{player.name} à gagner la parti."
			exit
			display
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
=begin
	def is_empty?(chekbox)
			if chekbox == " "
				return
			else
				puts "case occupé"
			end
	end
=end
end

class Player
	attr_accessor :name, :value
	attr_writer :he_won

	def initialize(name, value)
		@name = name
		@value = value
	end
end

class Game
	attr_accessor :player

	def initialize
		@player = player

		@player1 = Player.new("Player 1 => X", "X")
		@player2 = Player.new("Player 2 => O", "O")
		@new_board = Board.new
		

	end
	def go
		turn
	end

	def turn
		i = 1
		while (i <= 4 )  
			@new_board.display
			puts "Joueur 1 quelle case voulez vous jouez?"
			@new_board.play(@player1)
			@new_board.display
			puts "Joueur 2 quelle case voulez vous jouez?"
			@new_board.play(@player2)
			i += 1
			puts i

		end
		puts "MATCH NUUUULL"
	end
end

Game.new.go
