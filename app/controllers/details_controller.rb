class DetailsController < ApplicationController

  def index
    @capsule = Capsule.find(params[:capsule_id])
  end

end
