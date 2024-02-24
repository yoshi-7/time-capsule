class FormCapsuleFinalizeController < ApplicationController
  before_action :set_capsule

  def new
    @recipient = User.new
  end

  def create
    @recipient = User.new
  end

  def edit
    @recipient = User.new
  end

  def update
    @capsule.update(capsule_params)
    redirect_to capsule_path(@capsule)
  end

  def destroy
    @capsule.destroy
    redirect_to capsules_path
  end
  
end
