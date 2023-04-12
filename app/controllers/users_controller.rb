class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all_except(current_user.id)
    @rooms = current_user.rooms
  end
end
