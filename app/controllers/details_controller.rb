class DetailsController < ApplicationController
  before_action :set_capsule

  def index
  end

  def create
    redirect_to capsule_details_url(@capsule)
  end

  private

  def set_capsule
    @capsule = Capsule.find(params[:capsule_id])
  end

  def capsule_params
    params.require(:capsule).permit(:name, :user)
  end
end
