class RatingsController < ApplicationController
  def index
    @ratings = Rating.all
    render :index    # renderöin näkymätemplate /app/views/ratings/index.html.erb?
  end

  def new
    @rating = Rating.new
    @beers = Beer.all
  end

  def create
    #byebug
    Rating.create params.require(:rating).permit(:score, :beer_id)
    redirect_to ratings_path
  end

  def destroy
    rating = Rating.find(params[:id])
    rating.delete
    redirect_to ratings_path
  end

end