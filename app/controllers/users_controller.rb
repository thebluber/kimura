class UsersController < ApplicationController
  before_filter :authenticate_user!
  def my_kimuras
    @kimuras = current_user.kimuras.order("kimura_page").page(params[:page])
  end
end
