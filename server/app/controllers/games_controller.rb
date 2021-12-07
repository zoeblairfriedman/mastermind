require 'pry'

class GamesController < ApplicationController
  #change difficulty to turns in the db

def create
    game = Game.new()
    game.difficulty = 10;
    game.answer = game.set_answer
    game.save
    render json: {
        message: "Ready to play? You will have #{game.difficulty} turns.",
        game: game.id
      }
    # next steps!!
    
end


def show
    game = Game.find_by(id: params[:id])
    guess = params[:guess]
    if params[:guess] && game.check_guess(guess, game)
      game.handle_correct(game)
      render json: {
        message: "You have submited a correct answer!"
      }
    elsif params[:guess] && !game.check_guess(guess, game)
      correct = game.handle_incorrect(guess, game)
      render json: {
        message: "Your guess was incorrect",
        correct: correct,
        turns: game.difficulty
      }
    end
end


private 


# def game_params
#     binding.pry
#     params.require(:game).permit(:difficulty, :user_id)
# end

end
