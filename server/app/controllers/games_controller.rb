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
      game.handle_result(game, true)
      render json: {
        message: "You have submited a correct answer!",
        answer: guess,
        turns: game.difficulty,
        won: true
      }
    elsif params[:guess] && !game.check_guess(guess, game) && game.difficulty != 1
      answer_hash = game.handle_incorrect(game, guess)
      puts game.answer
      render json: {
        message: "Your guess was incorrect",
        turns: game.difficulty,
        answers: answer_hash
        # correct: answer_hash["correct"],
        # incorrect: answer_hash["incorrect"]
      } 
    else 
        game.handle_result(game, false)
        render json: {
          message: "YOU LOST",
          turns: game.difficulty,
          won: false
        }
    end
end


end
