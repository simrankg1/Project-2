class InvitesController < ApplicationController
before_filter :authenticate_user!

  def index
    @user = current_user
    @out_invites = Invite.where(ownerid: @user.id)
    @inc_invites = @user.invites.where('ownerid != ?', @user.id)  
    respond_to do |f|
      f.json {render :json => {
         :out_invites => @out_invites,
         :inc_invites => @inc_invites
          }}
      end
  end

  def new

  end

  def create
    parameters = params.require(:invite).permit(:date, :time, :address, :lat, :lng)
    parameters["ownerid"] = current_user.id
    new_invite = Invite.create(parameters)
    
    new_invite.users << current_user

    params[:users].each do |x|
        user = User.find_by_id(x)
        new_invite.users << user
    end

    send_text_message

    redirect_to :root
  end

  def confirm
    id = params[:id]
    invite = Invite.find_by_id(id)
    parameters = {}
    parameters["time"] = invite.time
    parameters["date"] = invite.date
    parameters["address"] = invite.address
    parameters["lat"] = invite.lat
    parameters["lng"] = invite.lng

    users = invite.users

    new_meet = Meet.create(parameters)
    new_meet.users << users
    
    confirmation_text_message

    invite.destroy

    flash[:alert] = "Confirmed!"
    
    redirect_to :root
  end

  def contacts
    @invite= Invite.new
     
  end

  def select_contacts
    if params[:contacts].nil?
      flash[:alert] = "Please select a contact to invite!"
      redirect_to :root
    else
      @invite_contact=params[:contacts]["add"] 
      @invite=Invite.new
      render :new 
    end
  end

  def show
    @invite = Invite.find(params[:id])

    respond_to do |f| 
    f.json {render :json => @invite.to_json{include :users}}
  end
  end

  def edit
    @invite = Invite.find(params[:id])
  end

  def update
    id = params[:id]
    invite = Invite.find_by_id(id)
    parameters = params.require(:invite).permit(:time, :date, :address, :lat, :lng, :ownerid)
    
    invite.update_attributes(parameters)

    # message to invite.users.where(id != current_user.id)
    #    RESCEDULE INCOMING   current_user wants to reschedule your invitation. check your incoming invites.

    render invite_path(invite)
  end

  def destroy
    id = params[:id]
    invite = Invite.find_by_id(id)

    # message to invite.users.where(id != current_user.id)
    #    CANCEL OUTGOING   current_user cancelled their invitation on month day
    #    DECLINE INCOMING  current_user declined your invitation

    invite.destroy

    redirect_to :invites_path
  end

  private

  def send_text_message

    id = params[:users].first
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
      :body => "#{current_user.name} sent you an invite!")
  end

  def confirmation_text_message
    id = params[:id]
    invite = Invite.find(id)
    recipient_id = invite.ownerid
    @invitee = User.find(recipient_id)
    
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
