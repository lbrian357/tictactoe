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
  attr_accessor :row1, :row2, :row3, :p1, :p2
  def initialize
    @row1 = [' ','|',' ','|',' ']

    @row2 = [' ','|',' ','|',' ']

    @row3 = [' ','|',' ','|',' ']

    @line =@@line 

    @p1 = Player.new(name1 = nil, 1, 'X')
    @p2 = Player.new(name2 = nil, 2, 'O')
  end

  def start
    #gather player info
    print 'Enter Player 1 name: '
    name1 = gets.chomp
    print 'Enter Player 2 name: '
    name2 = gets.chomp

    @p1.name = name1
    @p2.name = name2 
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


  def win?(p)
    #diagonal conditions
    if @row1[0] == @row2[2] && @row1[0] == @row3[4] && @row1[0] == p.xo
      p.victory = true
    elsif @row3[0] == @row2[2] && @row3[0] == @row1[4] && @row3[0] == p.xo
      p.victory = true
      #row conditions
    elsif @row1[0] == @row1[2] && @row1[0] == @row1[4] &&@row1[0] == p.xo
      p.victory = true
    elsif @row2[0] == @row2[2] && @row2[0] == @row2[4] &&@row2[0] == p.xo
      p.victory = true
    elsif @row3[0] == @row3[2] && @row3[0] == @row3[4] &&@row3[0] == p.xo
      p.victory = true
      #column conditions
    elsif @row1[0] == @row2[0] && @row1[0] == @row3[0] &&@row1[0] == p.xo
      p.victory = true
    elsif @row1[2] == @row2[2] && @row1[2] == @row3[2] &&@row1[2] == p.xo
      p.victory = true
    elsif @row1[4] == @row2[4] && @row1[4] == @row3[4] &&@row1[4] == p.xo
      p.victory = true
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

  def place_xo(p, row, col)
    if row >= 1 && row <= 3 && col >= 1 && col <= 3
      if row == 1 && @row1[find_col(col)] == ' ' 
        @row1[find_col(col)] = p.xo 
        true
      elsif row == 2 && @row2[find_col(col)] == ' ' 
        @row2[find_col(col)] = p.xo
        true
      elsif row == 3 && @row3[find_col(col)] == ' ' 
        @row3[find_col(col)] = p.xo
        true
      else
        false
      end
    else
      false
    end
  end

  def p1turn(p = @p1)
    puts "#{@p1.name}:" 
    print 'which row?'
    row = gets.chomp.to_i
    print 'which column?'
    col = gets.chomp.to_i
    if place_xo(p, row, col)
    else
      puts 'you can\'t do that, try again'
      self.p1turn
    end
    self.win?(@p1)
    self.win?(@p2)
    self.play
  end


  def p2turn(p = @p2)
    puts "#{@p2.name}:" 
    print 'which row?'
    row = gets.chomp.to_i
    print 'which column?'
    col = gets.chomp.to_i
    if place_xo(p, row, col)
    else
      puts 'you can\'t do that, try again'
      self.p2turn
    end
    self.win?(@p1)
    self.win?(@p2)
    self.play
  end

end

a = Game.new
#a.start

