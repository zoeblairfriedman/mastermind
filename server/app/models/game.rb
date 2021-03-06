require 'httparty'
require 'pry'

class Game < ApplicationRecord
  has_many :guesses

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
    game.update(difficulty: game.difficulty-=1)
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
    game.update(win: result)
  end

  def get_message(turns, answer_hash)
    message = ""
    num_correct = answer_hash["correct"].length
    if (num_correct === 0)
      message << "Not even close. " 
    else
      message << "Getting warmer, you got #{num_correct} right. "
    end
    message << "You have #{turns} turns left."
    return message
  end

  
end
