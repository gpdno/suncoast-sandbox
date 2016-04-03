class UsersController <ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  before_action :require_same_user, only: [:edit, :update]
  before_action :require_admin, only: [:destroy]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.username} to my blog"
      redirect_to articles_path
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to articles_path
    else
    render 'edit'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User and all associated articles are deleted"
    redirect_to users_path
  end
  
  private
    
    def set_user
      @user = User.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
    
    def require_same_user
      if current_user != @user && !current_user.admin?
        flash[:danger] = "You can only edit your own account"
        redirect_to root_path
      end
    end
    
    def require_admin
      if logged_in? && !current_user.admin?
        flash[:danger] = "access denied"
        redirect_to root_path
      end
    end
  
end