class CapsulesController < ApplicationController
  before_action :set_capsule, only: [:edit, :update]


  def index
    @capsules = Capsule.where(user: current_user)
  end

  def show
  end

  def new
    @capsule = Capsule.new()
    @capsule.user = current_user
    @capsule.save!
  end

  def create
  end

  def edit
  end

  def update
    @capsule.update(params[:capsule])
    redirect_to capsules_path
  end

  def destroy
  end

  def confirmation
    @capsule = Capsule.find(params[:capsule_id])
  end

  private

  def set_capsule
    @capsule = Capsule.find(params[:id])
  end

  def capsule_params
    params.require(:capsule).permit(:user, photos: [], videos: [], audio: [])
  end

end
