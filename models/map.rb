class Map

  DELIMETER = ';'.freeze

  attr_reader :board

  def initialize(str)
    @map_str = str
    @board = Board.new
    fill_board
  end

private

  def fill_board
    each_space do |row, col, tiles|
      tiles.each do |tile|
        board.place tile, row, col
      end
    end
  end

  def each_space(&block)
    @map_str
      .split(DELIMETER)
      .each_slice(8)
      .with_index do |slice, row|
        slice.each_with_index do |tile_strs, col|
          tiles =
            tile_strs
              .split(',')
              .map do |tile_str|
                Tile.string(tile_str)
              end
          yield row, col, tiles
        end
      end
  end

end
