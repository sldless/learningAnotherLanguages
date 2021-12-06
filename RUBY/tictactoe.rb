board = [" ", " ", " ", " "," ", " ", " ", " ", " "]
def input(input)
  input.to_i - 1
end

def display(board)
  puts "#{board[0]} | #{board[1]} | #{board[2]}"
  puts "-----------"
  puts "#{board[3]} | #{board[4]} | #{board[5]}"
  puts "-----------"
  puts "#{board[6]} | #{board[7]} | #{board[8]}"
end

def if_taken(board, place)
  if (board[place] == " ")
    return false
  else
    return true
  end
end

def turn_count(board)
  turn = 0
  board.each do |shape|
    if shape == "X" || shape == "O"
      turn += 1
    end
  end
  return turn
end

def current_player(turn_count)
  num_turns = turn_count
  if num_turns % 2 == 0
    player = "X"
  else
    player = "O"
  end
  return player
end
def move(board, place, player="X")
  board[place] = player
end
allPossibleWins = [[1, 2, 3],[4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
def wonCheck(winList, board)
  winList.each {|combo|
    comb0 = combo[0]
    comb2 = combo[1]
    comb3 = combo[2]

    place1 = board[comb0]
    place2 = board[comb2]
    place3 = board[comb3]

    if place1 == "X" && place2 == "X" && place3 == "X"
      return winList
    elsif place1 == "O" && place2 == "O" && place3 == "O"
      return winList
    end
  }
  return false
end
def fullCheck(board)
   board.all?{|shape| shape == "X" || shape == "O"}
end
def drawCheck(allPossibleWins, board)
  if !wonCheck(allPossibleWins, board) && fullCheck(board)
    return true
  else
    return false
  end
end
def overCheck(allPossibleWins, board)
  if wonCheck(allPossibleWins, board) || drawCheck(allPossibleWins, board)
    return true
  else
    return false
  end
end
def turn(board)
  puts "Choose a number between 1-9 to make a move: "
  inpt = gets.chomp
  place = input(inpt)
  if (place.between?(0, 8) && if_taken(board, place) == false)
    move(board, place, current_player(turn_count(board)))
    display(board)
  else
    turn
  end
end

def play(allPossibleWins, board)
  until overCheck(allPossibleWins, board) == true
    turn(board)
    if wonCheck(allPossibleWins, board)
      puts "Congrats, #{current_player(turn_count(board))} for winning Tic Tac Toe!"
    elsif drawCheck(allPossibleWins, board)
      puts "It's a Tie"
    end
  end
end

play(allPossibleWins, board)
