class UsersController < ApplicationController
  before_action :authenticate, except: %i[new create]
  before_action :load_current_user, except: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      login(@user)
      redirect_to root_path, notice: 'You signed up!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update user_params
      redirect_to user_path(@user), notice: 'User updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    @user.destroy
    redirect_to root_path, alert: 'User account deleted'
  end

  private

  def load_current_user
    if current_user.id == params[:id].to_i
      @user = current_user
    else
      redirect_to root_path, alert: 'Unauthorized'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
