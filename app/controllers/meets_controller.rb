class MeetsController < ApplicationController

  def index
    @meets=Meet.all
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
