class UsersController < ApplicationController
before_action :set_user, only: [:edit,:update]
  def edit
  end

  def update
    if current_user == @user
      if update_params[:password].empty?
        if @user.update_without_password(update_params)
          success_massage
        else
          fail_massage
        end
      else
        if @user.update_with_password(update_params)
          sign_in(@user, bypass: true)
          success_massage
        else
          fail_massage
        end
      end
    end
  end

private
  def set_user
    @user = User.find(params[:id])
  end

  def update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end

  def success_massage
    redirect_to root_path, notice: 'User情報が正常に更新されました'
  end

  def fail_massage
    redirect_to edit_user_path(@user), alert: '更新失敗しました'
  end
end
