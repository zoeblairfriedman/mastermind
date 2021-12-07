require 'pry'

class GamesController < ApplicationController

def create
    game = Game.new()
    game.difficulty = 10;
    game.answer = game.setAnswer
    game.save
    render json: {
        message: "Ready to play? You will have #{game.difficulty} turns.",
        game: game.id
      }
    # next steps!!
    
end


def show
  binding.pry
    game = Game.find_by(id: params[:id])
    # https://stackoverflow.com/questions/7316656/how-to-get-a-query-string-from-a-url-in-rails
end


private 


# def game_params
#     binding.pry
#     params.require(:game).permit(:difficulty, :user_id)
# end

end
