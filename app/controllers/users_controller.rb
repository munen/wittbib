# encoding: UTF-8
class UsersController < InheritedResources::Base
  def update
    @user = User.find(current_user.id)
    if @user.update_attributes(params[:user])
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to users_path, :notice => "Benutzer erfolgreich geändert"
    else
      render "edit"
    end
  end

end
