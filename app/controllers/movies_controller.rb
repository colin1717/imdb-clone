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
    @movie = Movie.new
    if @movie.save
      redirect_to @movie
    else
      render :index
    end
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
