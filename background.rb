class Background
    def initialize(window_height, window_width)
        @window_height = window_height
        @window_width = window_width
        @images = [Gosu::Image.new('media/player.png')]
        @image = @images[0]
        @image_width = @image.width
        @image_height = @image.height
        calculate_positions
    end
    
    def calculate_positions
        @y = [@window_height/2 - @image.height / 2, @window_height/2 - @image.height*1.5,  @window_height/2 + @image.height*1.5]
        @x = @window_width /2 - @image.width     
    end
    def draw
        @y.each do |value|
            @image.draw(@x, value, 0)

        end
    end
end