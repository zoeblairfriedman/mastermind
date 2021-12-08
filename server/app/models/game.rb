require 'httparty'
require 'pry'

class Game < ApplicationRecord

  API_url = "https://www.random.org/integers/?num=4&min=0&max=7&col=1&base=10&format=plain&rnd=new"

  def set_answer
    number = HTTParty.get(API_url).parsed_response
    num_string = number.split(/\n+/).join()
    self.answer = num_string
    return self.answer
  end

  def check_guess(guess, game)
    if guess === game.answer 
      return true
    else 
      puts game.answer
      return false
    end
  end

  def handle_incorrect(game, guess)
    game.difficulty -= 1
    game.save
    answer_arr = game.answer.split("")
    guess_arr = guess.split("")
    correct = get_correct(guess_arr, answer_arr)
    incorrect = get_incorrect(guess_arr, answer_arr)
    answer_hash = {}
    answer_hash["correct"] = correct || []
    answer_hash["incorrect"] = incorrect || []
    return answer_hash
  end

  def get_correct(guess, answer)
    same = guess.map.with_index { |ele,i| ele === answer[i]}
    return same.each_index.select { |i| same[i] }
  end

  def get_incorrect(guess, answer)
    same = guess.map.with_index { |ele,i| ele === answer[i]}
    return same.each_index.select { |i| !same[i] }
  end

  def handle_result(game, result)
    game.win = result
    game.save
  end
  
end
