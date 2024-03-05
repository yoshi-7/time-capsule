class ConfirmationsController < ApplicationController

  def index
    @capsule = Capsule.find(params[:capsule_id])
    emails = params[:confirmation]
    keys = emails.keys.select { |email| email.include?('email') }
    @recipients = []
    keys.each do |key|
      @recipients << emails[key]
    end
  end

end
