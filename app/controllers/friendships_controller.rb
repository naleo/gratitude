class FriendshipsController < ApplicationController
  before_action :authenticate

  def create
    @friendship = Friendship.new friendship_params
    if @friendship.save
      redirect_to users_path, notice: 'Friended'
    else
      redirect_to users_path, status: :unprocessable_entity
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    redirect_to users_path, notice: 'Unfriended'
  end

  private

  def friendship_params
    params.permit(:user_id, :friend_id)
  end
end
