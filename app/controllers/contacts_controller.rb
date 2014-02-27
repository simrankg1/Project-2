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
    if !user.users.include?(current_user)
    
      text_contact_req
      flash[:alert] = "Successfully added #{user.name}!"
    else
      contact_confirmation
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

  private

  def text_contact_req

    id = params[:id]
    user = User.find_by_id(id)

    @contact = user

    number_to_send_to = "+1#{@contact.phone}"

    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    twilio_phone_number = ENV['TWILIO_PHONE']

    @twilio_client = Twilio::REST::Client.new account_sid, auth_token

    @twilio_client.account.sms.messages.create(
      :from => ENV['TWILIO_PHONE'],
      :to => number_to_send_to,
      :body => "#{current_user.name} wants to add you as a contact!")
  end

  def contact_confirmation

    id = params[:id]
    user = User.find_by_id(id)
    @invitee = user

    number_to_send_to = "+1#{@invitee.phone}"

    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    twilio_phone_number = ENV['TWILIO_PHONE']

    @twilio_client = Twilio::REST::Client.new account_sid, auth_token

    @twilio_client.account.sms.messages.create(
      :from => ENV['TWILIO_PHONE'],
      :to => number_to_send_to,
      :body => "#{current_user.name} confirmed your invite!")
  end


end
