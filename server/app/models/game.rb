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

  def handle_correct(game)
    game.win = true;
    game.save
  end

  def handle_incorrect(guess, game)
    game.difficulty -= 1
    game.save
    # correct_arr = get_correct_arr(guess, game.answer)
    correct_arr = [1, 3]
    return correct_arr
  end

  def get_correct_arr(guess, answer)
    #this will return an array of indexes that match
  end
  
end
