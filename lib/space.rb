class Space

  attr_reader :row
  attr_reader :col
  attr_reader :content

  def initialize(row, col)
    @row = row
    @col = col
  end

  def free?
    content.nil? || content.is_a?(IceWall) && content.melted
  end

  def content=(thing)
    @content = thing
    thing.space = self
  end

  def coords
    [row, col]
  end

end
