class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update]


  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def edit
  end

  def show
  end

  def create
      @review = Review.new(review_params)
    if @review.save
      redirect_to @review
    else
      render :index
    end
  end

  def destroy
  end

  def update
    if @review.update_attributes(review_params)
      redirect_to @review
    else
      render :edit
    end
  end

  private

  def review_params
    params.require(:review).permit(:body, :movie_id, :user_id)
  end


end
