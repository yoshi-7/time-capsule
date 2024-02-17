class CapsulesController < ApplicationController
  def index
    @capsules = Capsule.where(user: current_user)
  end

  def show
  end

  def new
    @capsule = Capsule.new()
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

end
