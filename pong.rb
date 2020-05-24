require 'gosu'
require_relative "collision.rb"
require_relative "ball.rb"
require_relative "player.rb"
require_relative "stats.rb"
require_relative "background.rb"

class Pong < Gosu::Window
    
    def initialize
        super(800,600)
        @balls = [Ball.new(self.height, self.width)]
        @players = [Player.new(self.height, self.width, 1), Player.new(self.height, self.width, 2)]
        @stats = Statistics.new(self.height, self.width)
        @background = Background.new(self.height, self.width)
        background_music()
    end
    
    def update
        # Stats update
        if @balls[0].x <= 0 || @balls[0].x + @balls[0].image_width >= self.width
            @stats = Statistics.new(self.height, self.width)
        end
        
        if @balls[0].colliding?(@players) 
            @stats.add
            @balls[0].reverse
        end


        @balls.each do |entity|
            entity.update
        end
        if Gosu.button_down? Gosu::KB_W
            @players[0].update("up")
            
        elsif Gosu.button_down? Gosu::KB_S
            @players[0].update("down")
        end
        if Gosu.button_down? Gosu::KB_UP
            @players[1].update("up")
            
        elsif Gosu.button_down? Gosu::KB_DOWN
            @players[1].update("down")
        end
        if Gosu.button_down? Gosu::KB_SPACE
            @balls << Ball.new(self.height, self.width)
        end
    end
    
    def draw
        @players.each do |entity|
            entity.draw
        end
        @balls.each do |entity|
            entity.draw
        end
        @stats.draw
        @background.draw
    end
    
    def background_music
        @music = Gosu::Song.new('./media/spy.wav')
        @music.volume = 0.15
        @music.play(true)
    end
end

window = Pong.new
window.show
