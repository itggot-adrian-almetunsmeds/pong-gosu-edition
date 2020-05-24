class Statistics
    attr_reader :points
    def initialize(window_height, window_width)
        @points = 0
        @text = Gosu::Font.new(40)
    end

    def add
        @points += 1
    end

    def draw
        @text.draw_text(@points, 30, 10, 1)
    end
end