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
end


def show
    game = Game.find_by(id: params[:id])
    guess = params[:guess]
    if params[:guess] && game.check_guess(guess, game)
      game.handle_correct(game)
      render json: {
        message: "You have submited a correct answer!",
        answer: guess,
        turns: game.difficulty,
        won: true
      }
    elsif params[:guess] && !game.check_guess(guess, game) && game.difficulty != 1
      game.handle_incorrect(game)
      puts game.answer
      render json: {
        message: "Your guess was incorrect",
        turns: game.difficulty
      } 
    else 
        puts "YOU LOST"
        render json: {
          message: "YOU LOST",
          turns: game.difficulty,
          won: false
        }
    end
end


private 


# def game_params
#     binding.pry
#     params.require(:game).permit(:difficulty, :user_id)
# end

end
