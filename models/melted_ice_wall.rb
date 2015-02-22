module MeltedIceWall

  module_function

  def new
    IceWall.new.tap(&:melt)
  end

end
