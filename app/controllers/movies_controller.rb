class MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie, only: [:show, :edit, :update]

  def edit
  end

  def update
    if @movie.update_attributes(movie_params)
      redirect_to @movie
    else
      render :edit
    end
  end

  def show
    @review = Review.where(movie_id: @movie)
  end

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie
    else
      render :index
    end
  end



  private

  def movie_params
    params.require(:movie).permit(:title, :summary, :youtube_embed_link, :thumbnail, actor_ids: [])
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
