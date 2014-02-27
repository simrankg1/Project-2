class UsersController < ApplicationController

  

  def update_bio
    id = params[:id]
    user = User.find_by_id(id)
    bio = params[:bio]
    user.update_attribute(:bio, bio)

    redirect_to :root
  end

end