class ActorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_actor, only: [:show, :edit, :update]

  def index
    @actors = Actor.all
  end

  def edit
  end

  def show
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new(actor_params)
    if @actor.save
      redirect_to @actor
    else
      render :index
    end
  end

  private

  def set_actor
    @actor = Actor.find(params[:id])
  end

  def actor_params
    params.require(:actor).permit(:name, :year_of_birth, :thumbnail)
  end

end
