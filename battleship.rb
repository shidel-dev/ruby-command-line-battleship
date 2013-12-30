class Game
  attr_accessor :board1, :pieces 

  def initialize() 
    @pieces = {}
    @size_chart = {'a' => 5,'b' => 4, 'c' => 3, 'd' => 2, 's' => 1}
   @board1 =['+12345678910','a**********','b**********','c**********','d**********','e**********',
    'f**********','g**********','h**********','i**********','j**********']
    @board2 = {}
  end

  def place_ship(type,orientation,position,board = @board1)
    ship = {}
    if ['a','b','c','d','s'].include?(type) then ship[:type] = type else  return 'not valid type of ship' end
    if ['vertical','horizontal'].include?(orientation) then ship[:o] =  orientation else return 'not a valid orientation' end
    if (position[0].between?(1,10)) && ('a'..'j')===position[1] then ship[:pos] = position else return 'not valid type of ship' end
    build_board(ship,board)
  end  

  def build_board(ship,board)
    if !@pieces.empty? 
     @pieces.each_key {|key| if ship[:type] == @pieces[key][:type] then return false end}
    end
    if ship[:o] == 'horizontal'
      s_size = @size_chart[ship[:type]]
      row = 0
      board.each_with_index do |item,index|
        if item.start_with?(ship[:pos][1]) then row = index end
      end  
      org = board[row]
      for i in ship[:pos][0]...ship[:pos][0] + s_size
        if board[row][i] == '*' then board[row][i] = '#' else board[row] = org; return 'mistake in placement'end
      end 

      @pieces[@pieces.size+1] = ship 
      return true
    end 

    if ship[:o] == 'vertical'
      s_size = @size_chart[ship[:type]]
      col = ship[:pos][0]

      letters = ('a'..'j').to_a
      for i in letters.index(ship[:pos][1])+1...letters.index(ship[:pos][1])+s_size+1
        if board[i][col] == '*' then board[i][col] = '#' else board[i][col] = 'm';  fix(ship,board); return 'mistake in placement' end
      end 

      @pieces[@pieces.size+1] = ship
      return true 
    end 

  end

  def fix(ship,board)
    s_size = @size_chart[ship[:type]]
      col = ship[:pos][0]
    letters = ('a'..'j').to_a
    for i in letters.index(ship[:pos][1])+1...letters.index(ship[:pos][1])+s_size+1
      if board[i][col] == '#' 
        board[i][col] = '*' 
      elsif board[i][col] == 'm' 
        board[i][col] = '#' 
      else 
        return; 
      end
    end
  end

  def start 
    if validate()
      
    else 
      return 'incorrect amount of pieces'  
    end  
  end 

  def validate
    types = []
    valid_types = ['a','b','c','d','s']
    @pieces.each_key {|key| types.push(@pieces[key][:type])}
    if types.sort! == valid_types then return true else return false end

  end

end


game = Game.new
game.place_ship('b','horizontal',[2,'a'])
game.place_ship('c','vertical',[3,'b'])
game.place_ship('a','horizontal',[1,'j'])
game.place_ship('d','vertical',[10,'c'])
game.place_ship('s','horizontal',[1,'i'])



puts game.board1

game.start










