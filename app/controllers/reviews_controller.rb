class ReviewsController < ApplicationController
  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.new()
    @review.user_id = current_user.id
  end
  
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @movie = Movie.find(params[:movie_id])
    @review.movie_id = params[:movie_id].to_i
    if @review.save
      flash[:notice] = "Succefully added ratings and reviews"
      redirect_to :controller=>'movies', :action=> 'index'
    else
      flash[:alert] = "Something went wrong"
      redirect_to :controller=>'movies', :action=> 'index'
    end
  end
  
  private
  def review_params
    params.require(:review).permit(:content,:rating)
  end

end
