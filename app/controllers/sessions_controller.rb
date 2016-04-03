class SessionsController <ApplicationController
  
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to articles_path
    else
      flash.now[:danger] = "email and password do not match"
      render 'new'
    end
    
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "You are now logged out"
    redirect_to articles_path
  end
  
end