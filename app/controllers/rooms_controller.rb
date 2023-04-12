class RoomsController < ApplicationController
  def list_user
    @users = Room.find_by(id: params[:id])&.users.all_except(current_user.id)
  end
end
