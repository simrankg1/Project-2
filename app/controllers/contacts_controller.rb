class ContactsController < ActionController::Base

  def new
  end

  def add
    username = params[:username]
    result = User.find_by(username: username) 
    if result == current_user
      return nil
    else 
      @user = result
    end

    #except where user == current_user
    #and check to see if users have already been added. 
  end

  def update
    id = params[:id]
    user = User.find_by_id(id)
    current_user.users << user
    user.users << current_user
    flash[:alert] = "Successfully added #{user.name}!"
    redirect_to :root
  end

  def show
    id = params[:id]
    @user = User.find(id)
  end

end
