require 'pry'

class GamesController < ApplicationController

  # def new
  #   binding.pry
  #   @game = Game.new
  #   # set_list
  # end

def create
    game = Game.new()
    game.difficulty = 10;
    game.save
    render json: {
        message: "Ready to play? You will have #{game.difficulty} turns."
      }
    game.startGame
end


# def show
#     # @gig_songs = @gig.gig_songs
# end

# def index
#     # @musician = Musician.find_by(id: params[:musician_id])
#     # @gigs = @musician.gigs
#     # @gigs = @musician.gigs.by_date.not_over
# end



def index
  render json: Game.all
end


private 


# def game_params
#     binding.pry
#     params.require(:game).permit(:difficulty, :user_id)
# end

end
