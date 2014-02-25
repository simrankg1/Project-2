class InvitesController < ApplicationController
before_filter :authenticate_user!

def index
    @invites = Invite.all
  end

  def new
    @invite = Invite.new
  end

  def create
    parameters = params.require(:invite).permit(:date, :time, :address)
    parameters["ownerid"] = current_user.id
    new_invite = Invite.create(parameters)
     
    params[:users].each do |x|
        user = User.find_by_id(x)
        new_invite.users << user
        user.invites << new_invite
     end

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
