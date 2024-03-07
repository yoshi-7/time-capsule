class UserCapsulesController < ApplicationController
  def create
    @capsule = Capsule.find(params[:capsule_id])
    @capsule.update(capsule_params)
    emails = params[:confirmation]
    keys = emails.keys.select { |email| email.include?('email') }
    @recipients = []
    keys.each do |key|
      @recipients << emails[key]
    end
    @recipients.each do |recipient|
      user = User.where(email: recipient).to_a
      if user.first
        create_capsule(capsule: @capsule, user: user.first)
      else
        user << User.create(email: recipient, password: SecureRandom.urlsafe_base64)
        create_capsule(capsule: @capsule, user: user.first)
      end
    end
    @capsule.update(encapsulation_date: Time.now(), status: 'locked')
    redirect_to capsules_path
  end

  private

  def create_capsule(options = {})
    UserCapsule.create!(capsule: options[:capsule], user: options[:user])
  end

  def capsule_params
    params.require(:user_capsule).permit(:unlock_date)
  end
end
