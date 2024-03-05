class ConfirmationsController < ApplicationController
  before_action :set_capsule

  def index
  end

  def create
    raise
    # code here
    redirect_to capsule_confirmation_url(@capsule)
  end

  private

  def set_capsule
    @capsule = Capsule.find(params[:capsule_id])
  end

  def capsule_params
    params.require(:capsule).permit(:name, :user)
  end
end
