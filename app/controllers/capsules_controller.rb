class CapsulesController < ApplicationController

before_action :set_capsule, only: [:edit, :update, :destroy]

  def index
    @capsules = Capsule.where(user: current_user)
  end

  def show
    @capsule = Capsule.find(params[:id])
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

  def confirmation
    @capsule = Capsule.find(params[:capsule_id])
  end

  private

  def set_capsule
    @capsule = Capsule.find(params[:id])
  end

  def capsule_params
    params.require(:capsule).permit(:name, :user, :unlock_date, photos: [], videos: [], audios: [])
  end
end
