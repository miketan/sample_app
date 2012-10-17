class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy



  def show
	 @user = User.find(params[:id])
  end

  def new
    if !signed_in? || !current_user.admin?
      redirect_to root_path
    else
  	  @user = User.new
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      #sign_in @user
   	  flash[:success] = "User Added!"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.admin?
      flash[:failed] = "Unable to destroy admin user"
    else
      @user.destroy
      flash[:success] = "User destroyed."
    end
    redirect_to users_url
  end


  def index
    @users = User.paginate(page: params[:page])
  end


  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end

    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
