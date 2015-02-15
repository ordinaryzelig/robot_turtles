class Program

  def initialize(cards, turtle)
    @cards  = cards
    @turtle = turtle
  end

  def run
    @cards.each do |card|
      card.play @turtle
    end
  end

end
