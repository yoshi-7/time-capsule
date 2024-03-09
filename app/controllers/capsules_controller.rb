class CapsulesController < ApplicationController

before_action :set_capsule, only: [:edit, :update, :destroy]

  def index
    user_capsule_ids = UserCapsule.where(user: current_user).pluck(:capsule_id)
    @capsules = Capsule.where(user: current_user).or(Capsule.where(id: user_capsule_ids))
  end

  def show
    @capsule = Capsule.find(params[:id])
    user_capsule_ids = UserCapsule.where(capsule: @capsule).pluck(:user_id)
    @users = User.where(id: user_capsule_ids)
  end

  def new
  end

  def create
    @capsule = Capsule.create(user: current_user)
    redirect_to edit_capsule_path(@capsule), notice: 'Capsule was successfully created'
  end

  def edit
  end

  def update
    if @capsule.update(capsule_params)
      redirect_back(fallback_location: capsules_path)
    end
  end

  def destroy
    if @capsule.destroy
      redirect_to capsules_path
    end
  end

  private

  def set_capsule
    @capsule = Capsule.find(params[:id])
  end

  def capsule_params
    params.require(:capsule).permit(:name, :user, :unlock_date, photos: [], videos: [], audios: [])
  end
end
