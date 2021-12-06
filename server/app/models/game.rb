class Game < ApplicationRecord

  # def turn=()
  #   @turn = 0
  # end

  # def turn
  #   @turn
  # end
  def initialize(turns)
    @turns = turns
  end

  def turns
    @turns
  end
end
