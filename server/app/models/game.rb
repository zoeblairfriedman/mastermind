require 'httparty'
require 'pry'

class Game < ApplicationRecord

  API_url = "https://www.random.org/integers/?num=4&min=0&max=7&col=1&base=10&format=plain&rnd=new"

  def setAnswer
    number = HTTParty.get(API_url).parsed_response
    numString = number.split(/\n+/).join()
    self.answer = numString
    return self.answer
  end
  
end
