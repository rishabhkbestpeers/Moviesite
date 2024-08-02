class AdminController < ApplicationController

  def index
      @movies = Movie.all
  end

  def user_access
      @users = User.all
  end

  def destroy
      @user = User.find(params[:id])
      UserMailer.user_deleted(@user).deliver_now
      @user.destroy
      flash[:notice] = "User is successfully deleted!"
      redirect_to admin_user_access_path, status: :ok
  end

end
