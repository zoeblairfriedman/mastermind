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
    guess = Guess.create(input: params[:guess], game_id: game.id)
    if params[:guess] && game.check_guess(guess.input, game)
      game.handle_result(game, true)
      render json: {
        message: "VICTORY! The answer was #{guess.input}! You guessed correctly with #{game.difficulty - 1} turn(s) to spare.",
        won: true
      }
    elsif params[:guess] && !game.check_guess(guess.input, game) && game.difficulty != 1
      answer_hash = game.handle_incorrect(game, guess.input)
      message = game.get_message(game.difficulty, answer_hash)
      puts game.answer
      render json: {
        message: message,
        turns: game.difficulty,
        answers: answer_hash
      } 
    else 
        game.handle_result(game, false)
        render json: {
          message: "YOU LOST. The answer was #{game.answer}",
          won: false
        }
    end
end


end
