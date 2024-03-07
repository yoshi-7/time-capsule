class ConfirmationPagesController < ApplicationController
  
  def show
    @capsule = Capsule.find(params[:capsule_id])
  end  

end
