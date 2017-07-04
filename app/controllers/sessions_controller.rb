class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      flash[:success] = "ログインしました！"
      redirect_to root_path
    else
      flash.now[:danger] = '無効なメールアドレスとパスワードの組み合わせです。'
      render 'new'
    end
  end
  
  def destroy
    flash[:info] = 'ログアウトしました！'
    log_out if logged_in?
    redirect_to root_url
  end
end