require 'pry'

WINS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]]

def win?(board)
  WINS.any? do |x, y, z|
    board[x] == board[y] && board[y] == board[z]
  end
end

def draw?(board)
  board.all? { |x| x.is_a? String }
end

def game_over?(board)
  win?(board) || draw?(board)
end

def pick_letter
  puts "Please choose: 'X' or 'O'"
  result = gets.chomp
  until result =~ /^[xo]$/i
    puts "No dummy, you can only pick 'X' or 'O'!"
    result = gets.chomp
  end
  result.upcase
end

def show_board(board)
  puts "
   #{board[0]}  |  #{board[1]}  |  #{board[2]}
   #{board[3]}  |  #{board[4]}  |  #{board[5]}
   #{board[6]}  |  #{board[7]}  |  #{board[8]}
  "
end

def choose_move(board)
  show_board(board)
  puts "Please pick a numbered square: "
  result = gets.chomp
  available = board.select { |x| x.is_a? Fixnum }
  # until available.include?(result.to_i)
  #   puts "Sorry, pick again:"
  #   result = gets.chomp
  # end
  # until result =~ /[1-9]/ && available.include?(result)
  #   puts "Sorry, pick again: "
  #   result = gets.chomp
  # end
  until result =~ /^#{available}$/
    puts "Sorry, please pick a numbered square: "
    result = gets.chomp
  end
  result.to_i - 1
end

# def choose_cpu_move(board)
#   available = board.select { |x| x.is_a? Fixnum }
#   available.sample - 1
# end

def tic_tac_toe
  board = (1 .. 9).to_a
  current_player = pick_letter
  until game_over?(board)
    puts "Your move Player '#{current_player}'!"
    move = choose_move(board)
    board[move] = current_player
    current_player = current_player == 'X' ? 'O' : 'X'
  end
  puts "Game Over!"
end

tic_tac_toe
