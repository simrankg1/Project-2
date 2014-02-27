class MeetsController < ApplicationController
before_filter :authenticate_user!
 
  def index
    @user=current_user
    @meets= @user.meets
    @out_invites = Invite.where(ownerid: @user.id)
    @inc_invites = @user.invites.where('ownerid != ?', @user.id)
    respond_to do |f|
      f.html
      f.json {render :json => @meets.to_json(:include => { :users => { :only => :name} })}
    end
  end

  def contacts
    @user = current_user
    @confirmed_contacts=[]
    @out_pending_contacts= []
    @inc_pending_contacts= []
    ##all users as pending or no contacts at all"
    unless @user.users.nil?
      @user.users.each do |user|
        if user.users.include?(@user) && @user.users.include?(user)
          @confirmed_contacts << user
        else @user.users.include?(user) 
          @out_pending_contacts << user
        end
      end
    end
    User.all.each do |user|
      if  user.users.include?(@user) && !@confirmed_contacts.include?(user)
          @inc_pending_contacts << user
      end
    end
    respond_to do |f| 
      f.json {render :json => 
        {:confirmed_contacts =>@confirmed_contacts,
         :out_pending_contacts => @out_pending_contacts,
         :inc_pending_contacts => @inc_pending_contacts
          }}
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
