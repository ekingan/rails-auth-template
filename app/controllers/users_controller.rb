class UsersController < ApplicationController
	# before_action :require_login, only: :index

	def index
		@users = User.all
	end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to @user, flash: { success: "Successfully signed up!" }
  	else
  		# show errors
      redirect_to signup_path, flash: { error: @user.errors.full_messages.to_sentence }
  	end
  end

  def show
  	@user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
