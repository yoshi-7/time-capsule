class DashboardController < ApplicationController
  def show
    @capsules = current_user.capsules
  end
end
