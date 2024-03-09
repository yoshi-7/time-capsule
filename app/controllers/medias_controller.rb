class MediasController < ApplicationController
  def create
    @capsule = Capsule.find(params[:capsule_id])
    @capsule.photos.attach(params[:capsule][:photos])
    @capsule.videos.attach(params[:capsule][:videos])
    @capsule.audios.attach(params[:capsule][:audios])
    @capsule.save
    redirect_to edit_capsule_path(@capsule)
  end
end
