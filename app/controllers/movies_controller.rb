class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit]

  def edit
  end

  def show
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
    params.require(:movie).permit(:title, :summary, :youtube_embed_link, :thumbnail)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
