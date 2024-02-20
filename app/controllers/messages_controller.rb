class MessagesController < ApplicationController

  def new
    @capsule = Capsule.find(params[:capsule_id])
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @capsule = Capsule.find(params[:capsule_id])
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
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:title, :content, :capsule_id)
  end
end
