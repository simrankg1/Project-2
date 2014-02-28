class ContactsController < ActionController::Base

  include ApplicationHelper

  def newcontact
  end

  def addcontact
    
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
    
    if !user.users.include?(current_user)
      send_text_message(id, "#{current_user.name} wants to add you as a contact!")
      flash[:alert] = "Successfully added #{user.name}!"
    else
      send_text_message(id, "#{current_user.name} added you as a contact!")
    end

    current_user.users << user

    redirect_to :root
  end

  def show
    id = params[:id]
    @user = User.find(id)
    respond_to do |f|
      f.html
      f.json {render :json=> @user}
    end
  end

end
