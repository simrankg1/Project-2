class InvitesController < ApplicationController
before_filter :authenticate_user!

def index
    @invites = Invite.all
  end

  def new
    @invite = Invite.new
  end

  def create
    new_invite = params.require(:invite).permit(:time, :address, :lat, :lgn, :user_id, :created_at, :updated_at)
    # new_invite[:user_id] = current_user.id
    @invite = Invite.create(new_invite)
    render :show
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
