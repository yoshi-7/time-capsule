class MediasController < ApplicationController
  def create
    @capsule = Capsule.find(params[:capsule_id])
    @capsule.photos.attach(params[:capsule][:photos])
    @capsule.save
    render 'capsules/edit'
  end
end
