class MediasController < ApplicationController
  def create
    raise
    @capsule = Capsule.find(params[:capsule_id])
    @capsule.photos.attach(params[:capsule][:photos])
    @capsule.videos.attach(params[:capsule][:videos])
    @capsule.audios.attach(params[:capsule][:audios])
    @capsule.save
    render 'capsules/edit'
  end
end
