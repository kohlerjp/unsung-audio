class ArtistsController < ApplicationController
  def new
  	@artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      sign_in(@artist)
      redirect_to(@artist)
    else
      render 'new'
    end 
  end

  def show
  	@artist = Artist.find(params[:id])
  end
  def index
  	@artists = Artist.all
  end

  private

  	def artist_params
  		return params.require(:artist).permit(:name,:email,:password,:password_confirmation)
  	end
end
