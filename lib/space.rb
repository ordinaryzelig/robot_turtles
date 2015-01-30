class Space

  attr_accessor :row
  attr_accessor :col
  attr_accessor :content

  def free?
    content.nil? || content.is_a?(IceWall) && content.melted
  end

end
