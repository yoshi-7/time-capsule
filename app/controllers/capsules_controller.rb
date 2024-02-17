class CapsulesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
    @capsule = Capsule.find(params[:id])
    render _form_capsule
  end

  def update
    @capsule = Capsule.find(params[:id])
    @capsule.update(params[:capsule])
    redirect_to capsule_path(@capsule)
  end

  def destroy
  end

  private

  def capsule_params
    params.require(:capsule).permit(:user)
  end
end
