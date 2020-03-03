# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require './player'
require './question'

## Your test code can go here

class Game
attr_accessor :player1 ,:player2, :current_player
  def initialize
    @player1 = Player.new('professor')
    @player2 = Player.new('student')
    @current_player=@player1
  end

  def switch_player
    if @current_player == @player1
      return @current_player = @player2
    else return @current_player=@player1
    end
  end

  def generate_question
    @question= Question.new
    puts "#{@current_player.name}: what does #{@question.numA} plus #{@question.numB}  equal?"
  end 

  def game_over
    puts "#{switch_player().name} wins with a score of #{switch_player.lives}/3"
    puts "--------GAME OVER--------"
    puts "Good Bye!"
  end

  def game_logic

    puts "-----Prof vs Student-----"
    
    while @current_player.lives>0
      switch_player()
      generate_question()
      player_response = $stdin.gets.chomp

      if player_response.to_i == @question.ans
        puts "#{@current_player.name} :YES! you are corrrect"
        puts "student: #{player1.lives}/3  vs  Prof: #{player2.lives}/3"
      else 
        @current_player.lives -= 1
        puts "#{@current_player.name} :Seriously ? No"
        puts "student: #{player1.lives}/3  vs  prof: #{player2.lives}/3"
        puts "-----NEW TURN-----"
      end
    end
    switch_player()
    game_over()
  end
end

game1=Game.new
game1.game_logic()
