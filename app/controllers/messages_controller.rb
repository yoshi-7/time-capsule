class MessagesController < ApplicationController

  def new
    @capsule = Capsule.find(params[:capsule_id])
    @message = Message.new
  end

  def create

  end

  def edit
  end

  def update
  end

  def destroy
  end
end
