class PagesController < ApplicationController
  def home

  if current_user
    if current_user.admin?
      flash[:notice] = "Logged In Successfully!"
      redirect_to user_admin_path
    else
      flash[:notice] = "Logged In Successfully!"
      redirect_to movies_path
    end
  end

  end
end
