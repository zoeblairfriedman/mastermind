require 'httparty'
require 'pry'

class Game < ApplicationRecord
  # def initialize(turns = 10)
  #   @turns = turns
  # end


  # def turns # getter method
  #   @turns
  # end
  
  # def turns=(val) # setter method
  #   @turns = val
  # end

  API_url = "https://www.random.org/integers/?num=4&min=0&max=7&col=1&base=10&format=plain&rnd=new"

  def startGame
    number = HTTParty.get(API_url)
    puts number
  end
end
