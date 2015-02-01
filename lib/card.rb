class Card

  def play(turtle)
    turtle.public_send self.class.name
  end

end
