class GamesController < ApplicationController

  # def new
  #   binding.pry
  #   @game = Game.new
  #   # set_list
  # end

def create
    binding.pry
    game = Game.new(game_params)
    # if !current_musician.bands.include?(@gig.band)
    #     current_musician.bands << @gig.band
    # end
    # if @gig.save
    #     flash[:message] = "Rock. Gig Saved!" 
    #     redirect_to gig_path(@gig)
    # else
    #     set_list
    #     render :new
    # end
    binding.pry
end


# def show
#     # @gig_songs = @gig.gig_songs
# end

# def index
#     # @musician = Musician.find_by(id: params[:musician_id])
#     # @gigs = @musician.gigs
#     # @gigs = @musician.gigs.by_date.not_over
# end



def index
  render json: Game.all
end


private 


def game_params
    binding.pry
    params.require(:game).permit(:difficulty, :user_id)
end

end
