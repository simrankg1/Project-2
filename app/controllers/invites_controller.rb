class InvitesController < ApplicationController
before_filter :authenticate_user!

  def index
    @invites = Invite.all
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
  end

  def edit
    @invite = Invite.find(params[:id])
  end

  def update
    @invite = current_user.invites.where(:id => params[:id])
    @invite.update_attributes(params[:invite])
    render :show
  end

  def destroy
    @invite = current_user.invites.where(:id => params[:id])

    invite.delete
    redirect_to(invites_path)
  end

end
