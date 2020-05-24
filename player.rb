class Player
    attr_reader :player_id, :x, :y, :image_width, :image_height
    def initialize(window_height, window_width, player_id)
        @window_height = window_height
        @window_width = window_width
        @image = Gosu::Image.new('media/player.png')
        @image_width = @image.width
        @image_height = @image.height
        if player_id == 1
            @x = 20
        elsif player_id == 2
            @x = @window_width - (20 + @image.width)
        end
        @y = (@window_height / 2) - (@image.height / 2)
    end

    def update(arg)
        if arg == "up"
            if @y-1 >= 0
                @y -= 4
            end
        elsif arg == "down"
            if( @y + @image.height + 1) < @window_height
                @y += 4
            end
        end        
    end
    
    def draw
        @image.draw(@x, @y, 1)
    end
end