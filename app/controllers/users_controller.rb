class UsersController < ApplicationController
  before_action :logged_in_user , only: [:edit , :update]
  before_action :correct_user , only: [:edit, :update]
  before_action :admin_user , only: [:destroy ,:edit , :update]

  def index
    @users = User.paginate(page: params[:page] , per_page: 3)
  end
  def new
  	@user = User.new
  end
  def show
  	@user = User.find(params[:id])
    @micropost = Micropost.new
  end
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "user deleted"
    redirect_to users_path
  end
  def user_params
  	params.require(:user).permit(:name , :email , :password , :password_confirmation)
  end
  def create
   
  	@user = User.new(user_params)
  	if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = "Please check your email to activate your account."     
      redirect_to root_path
      #log_in @user
      #redirect_to @user
      #flash[:success] = "Welcome  " + @user.name      
  	else
  		render 'new'
      flash[:danger] = "Failed to Sign Up"
  	end
  end

  def edit 
    @user = User.find(params[:id])
  end
  def update
    @user =User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:success] = "Profile Updated"       
      redirect_to @user
    else
      render 'edit'
    end 
  end

  def logged_in_user
    if !logged_in?
      store_location
      flash[:danger] = "Please Login"
      redirect_to login_path
    end
  end

  def correct_user
    @user = User.find(params[:id])
    if !(@user==current_user)
      redirect_to root_path
    end
  end

  def admin_user
    if !current_user.admin?
      redirect_to root_path
    end
  end
end
