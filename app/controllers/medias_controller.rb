class MediasController < ApplicationController
  def create
    @capsule = Capsule.find(params[:capsule_id])
    if params.require(:capsule).include?('photos')
      @capsule.photos.attach(params[:capsule][:photos])
    elsif params.require(:capsule).include?('videos')
      @capsule.videos.attach(params[:capsule][:videos])
    elsif params.require(:capsule).include?('audios')
      @capsule.audios.attach(params[:capsule][:audios])
    end
    @capsule.save
    redirect_to edit_capsule_path(@capsule)
    flash.notice = "Media(s) successfully uploaded"
  end
end
