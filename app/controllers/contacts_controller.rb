class ContactsController < ActionController::Base

  def new
  end

  def add
    username = params[:username]
    @user = User.find_by(username: username)
  end

  def update
    id = params[:id]
    user = User.find_by_id(id)
    current_user.users << user
    user.users << current_user
    flash[:alert] = "Successfully added #{user.name}!"
    redirect_to :root
  end

end
