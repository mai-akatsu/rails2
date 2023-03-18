class UsersController < ApplicationController
  def account
    @user = User.find(current_user.id)  

  end

  def profile
    @user = User.find(current_user.id)  
  end
  
  def edit
    @user = User.find(current_user.id)  
  end
  
  def update
    @user = User.find(current_user.id)
    if @user.update(params.require(:user).permit(:name, :avator, :profile))
      flash[:notice] = "保存しました。"
      redirect_to users_profile_path
    else
      flash[:alert] = "問題が発生しました。"
      render "edit"
    end
  end
  
end
