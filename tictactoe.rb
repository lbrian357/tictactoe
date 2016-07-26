module TttGame

  @@line = []
  5.times {@@line.push('-')} 

  def find_col(n)
    if n == 1
      0
    elsif n == 2
      2
    elsif n == 3
      4
    end
  end
end


class Player 
  include TttGame
  attr_accessor :name, :player_num, :xo, :victory
  def initialize(name, player_num, xo)
    @name = name
    @player_num = player_num
    @xo = xo
    @victory= false
  end
   
end



class Game < Player
  include TttGame
  attr_accessor :row1, :row2, :row3
  def initialize
    @row1 = [' ','|',' ','|',' ']

    @row2 = [' ','|',' ','|',' ']

    @row3 = [' ','|',' ','|',' ']

    @line =@@line 
  end
=begin
  def row1
    @row1
  end

  def row1=(c)
    @row1[find_col(c)] = c 
  end

  def row2
    @row2
  end

  def row2=(c)
    @row2[find_col(c)] = c 
  end

  def row3
    @row3
  end

  def row3=(c)
    @row3[find_col(c)] = c  
  end
=end
  def start
    print 'Enter Player 1 name: '
    name1 = gets.chomp
    xo1 = 'X'
    xo2 = 'O'
=begin
    print 'Are you X or O? '
    xo1 = gets.chomp
    if xo1 == 'X' 
      xo2 == 'O'
    elsif xo1 == 'O' 
      xo2 == 'X'
    else
      puts 'please enter X or O only'
      retry
    end
=end
    player1 = 1
    player2 = 2
    print 'Enter Player 2 name: '
    name2 = gets.chomp
    
    @p1 = Player.new(name1, 1, xo1)
    @p2 = Player.new(name2, 2, xo2) 
    puts "#{@p1.name} you are #{@p1.xo}"
    puts "#{@p2.name} you are #{@p2.xo}"

    #starts game
    self.play
    until @p1.victory == true || @p2.victory == true
      self.p1turn
      break if @p1.victory == true || @p2.victory == true
      self.p2turn
    end
      
  end    

=begin 
  def win_condition
    if @p1condition == true
      puts 'Player 1 has won'
      return true
    elsif @p2condition == true
      puts 'Player 2 has won'
      return true
    else
      return false
    end
  end
=end 

  def win?(p)
#diagonal conditions
    if @row1[0] == @row2[2] && @row1[0] == @row3[4] && @row1[0] ==p.xo
      p.victory = true
      p 1
    elsif @row3[0] == @row2[2] && @row3[0] == @row1[4] && @row3[0] ==p.xo
      p.victory = true
      p 2
#row conditions
    elsif @row1[0] == @row1[2] && @row1[0] == @row1[4] &&@row1[0] ==p.xo
      p.victory = true
      p 3
    elsif @row2[0] == @row2[2] && @row2[0] == @row2[4] &&@row2[0] ==p.xo
      p.victory = true
      p 4
    elsif @row3[0] == @row3[2] && @row3[0] == @row3[4] &&@row3[0] ==p.xo
      p.victory = true
      p 5
#column conditions
    elsif @row1[0] == @row2[0] && @row1[0] == @row3[0] &&@row1[0] ==p.xo
      p.victory = true
      p 6
    elsif @row1[2] == @row2[2] && @row1[2] == @row3[2] &&@row1[2] ==p.xo
      p.victory = true
      p 7
    elsif @row1[4] == @row2[4] && @row1[4] == @row3[4] &&@row1[4] ==p.xo
      p.victory = true
      p 8
    end
    if p.victory == true
      puts "#{p.name} wins"
    end
  end

  def play
    puts @row1.join('')
    puts @line.join('')
    puts @row2.join('')
    puts @line.join('')
    puts @row3.join('')

  end

  def p1turn
    puts "#{@p1.name}:" 
    print 'which row?'
    row = gets.chomp.to_i
    print 'which column?'
    col = gets.chomp.to_i
    if row == 1 && @row1[find_col(col)] == ' ' 
 #   self.row1 = 'X'
    @row1[find_col(col)] = 'X'
    elsif row == 2 && @row2[find_col(col)] == ' ' 
    @row2[find_col(col)] = 'X'
    elsif row == 3 && @row3[find_col(col)] == ' ' 
    @row3[find_col(col)] = 'X'

    else
      'you\'ve entered the wrong info and have lost your turn'
    end
    
    self.win?(@p1)
    self.win?(@p2)
    self.play
  end

  def p2turn
    puts "#{@p2.name}:" 
    print 'which row?'
    row = gets.chomp.to_i
    print 'which column?'
    col = gets.chomp.to_i
    if row == 1 && @row1[find_col(col)] == ' ' 
      @row1[find_col(col)] = 'O'
    elsif row == 2 && @row2[find_col(col)] == ' ' 
      @row2[find_col(col)] = 'O'
    elsif row == 3 && @row3[find_col(col)] == ' ' 
      @row3[find_col(col)] = 'O'
    else
      'you\'ve entered the wrong info and have lost your turn'
    end
    self.win?(@p1)
    self.win?(@p2)
    self.play
  end

end



