class MediaController < ApplicationController
  def create
    raise
    @capsule = Capsule.find(params[:capsule_id])
    params[:capsule][:photo].each do |blob|
      @attachment = @capsule.attachments.build(photo: blob)
      @attachment.save
    end
    redirect_to edit_capsule_path(@capsule)
  end
end
