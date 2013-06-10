class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    redirect_to users_my_kimura_path(current_user)
  end
end
