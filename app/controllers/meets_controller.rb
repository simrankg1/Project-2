class MeetsController < ApplicationController
before_filter :authenticate_user!
  def index
    @user = current_user
    @meets= @user.meets
    @contacts = @user.users
    @outgoing = @user.invites
    @incoming = Invite.all.where(user_id: @user.id)

  end

  def contacts
    @user = current_user
    @contacts = @user.users
    respond_to do |f| 
      f.json {render :json => @contacts.to_json}
    end
  end

  def new
    @meet= Meet.new
  end

  def create
    new_meet= params.require(:meet).permit(:address, :time, :user_id, :lat, :lgn, :comment)
    @meet= Meet.create(new_meet)
    render :show
  end

  def show
    @meet= Meet.find(params[:id])
  end

  def edit
    @meet=Meet.find(params[:id])
  end

  def update
    meet=Meet.find(params[:id])
    meet.update_attributes(params[:meet])
    redirect_to(meet)
  end

  def destroy
      @meet = current_user.meets.where(:id => params[:id])

      meet.delete
      redirect_to(meets_path)
  end


end
