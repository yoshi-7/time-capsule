class MessagesController < ApplicationController
  before_action :set_capsule
  before_action :set_message, only: [:edit, :update, :destroy]

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.capsule = @capsule
    if @message.save
      redirect_to edit_capsule_path(@capsule)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @message.update(message_params)
      redirect_to edit_capsule_path(@capsule)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @message.destroy
      redirect_to edit_capsule_path(@capsule)
    end
  end

  private

  def message_params
    params.require(:message).permit(:title, :content)
  end

  def set_capsule
    @capsule = Capsule.find(params[:capsule_id])
  end

  def set_message
    @message = Message.find(params[:id])
  end
end
