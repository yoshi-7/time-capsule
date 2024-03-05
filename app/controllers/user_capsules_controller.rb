class UserCapsulesController < ApplicationController
  def create
    @capsule = params[:capsule_id]
    @recipients = params[:recipients]
    @recipients.each do |recipient|
      UserCapsule.new(capsule: @capsule, user: User.create(email: recipient))
    end
    @capsule.update(encapsulation_date: Time.now(), status: 'locked')
  end
  raise

  private
end
