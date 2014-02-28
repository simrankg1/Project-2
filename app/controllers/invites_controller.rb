class InvitesController < ApplicationController
before_filter :authenticate_user!

  include ApplicationHelper

  def index
    @user = current_user
    @out_invites = Invite.where(ownerid: @user.id)
    @inc_invites = @user.invites.where('ownerid != ?', @user.id)  
    respond_to do |f|
      f.json {render :json => {
        :out_invites => @out_invites.as_json(:include => [:users]),
         :inc_invites => @inc_invites.as_json(:include => [:users])
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
        send_text_message(user.id, "#{current_user.name} sent you an invite!")
    end

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
    
    users.each do |u|
      unless u.id == current_user.id
        send_text_message(u.id, "#{current_user.name} confirmed your invite!")
      end
    end

    invite.destroy

    flash[:alert] = "Confirmed!"
    
    redirect_to :root
  end

  def contacts
    @invite= Invite.new
    @confirmed_users = []
    current_user.users.each do |u|
      if current_user.users.include?(u) && u.users.include?(current_user)
        @confirmed_users << u
      end
    end
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
<<<<<<< HEAD
      f.json {render :json => @invite.to_json{include :users}}
    end
=======
    f.json {render :json => @invite.as_json(:include => [:users])}
  end
>>>>>>> upstream/master
  end

  def edit
    @invite = Invite.find(params[:id])
  end

  def update
    id = params[:id]
    invite = Invite.find_by_id(id)
    parameters = params.require(:invite).permit(:time, :date, :address, :lat, :lng, :ownerid)
    
    invite.update_attributes(parameters)

    users = invite.users.where('id != ?', current_user.id)
    users.each do |u|
      send_text_message(u.id, "#{current_user.name} wants to reschedule the invitation for #{invite.date}. Check your incoming invites.")
    end

    render invite_path(invite)
  end

  def destroy
    id = params[:id]
    invite = Invite.find_by_id(id)

    if current_user.id == invite.ownerid
      users = invite.users.where('id != ?', current_user.id)
      users.each do |u|
        send_text_message(u.id, "#{current_user} cancelled their invation on #{invite.date}")
      end
    else
      send_text_message(invite.ownerid, "#{current_user} declined your invitation on #{invite.date}")
    end

    invite.destroy

    redirect_to :root
  end

end
