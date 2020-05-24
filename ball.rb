class Ball < Collision
    attr_reader :y, :x, :image_width, :image_height
    def initialize(window_height, window_width)
        @window_height = window_height
        @window_width = window_width
        
        @sound = Gosu::Sample.new('media/collision.wav')
        @image = Gosu::Image.new('media/square.png')
        @image_width = @image.width
        @image_height = @image.height
        @x = (@window_width / 2)-(@image.width / 2)
        @y = (@window_height / 2)-(@image.height / 2)
        
        @vel_x = rand(0..6)
        @vel_y = rand(0..6) 
        
        if @vel_x == 0
            @vel_x += 1
        end
        if @vel_y == 0
            @vel_y -= 1
        end
        if rand(0..1) == 1
            @vel_x *= -1
        end
        if rand(0..1) == 1
            @vel_y *= -1
        end
    end
    # TODO: Fix speed issus. Connected with collision detction of 
    # an object that transports through the compared object.
    def reverse
        @vel_x *= -1
        temp  = rand(0..5)
        if temp == 1
            @vel_x += 2
        elsif temp == 2
            @vel_y += 1
        elsif temp == 3
            @vel_x += 1
        elsif temp == 4
            @vel_x += -3
        end
        if @vel_x > 4 
            @vel_x = 4
        end
        if @vel_y > 8
            @vel_y = 8
        end 
        
    end
    
    def update
        @x += @vel_x
        @y += @vel_y
        
        if (@x + @image.width) >= @window_width || @x <= 0
            @vel_x = @vel_x*-1
            @sound.play
        end
        
        if (@y + @image.height) >= @window_height || @y <= 0
            @vel_y = @vel_y*-1
            @sound.play
        end
    end
    
    def draw
        @image.draw(@x, @y, 0)
    end
end
