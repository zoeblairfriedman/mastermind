class Guess < ApplicationRecord
  belongs_to :game

  scope :sort_desc, -> {order(id: :desc)}

  def get_guess_arr
    return Guess.where(game_id: self.game_id).sort_desc.map{|guess| guess.input}
  end

end
