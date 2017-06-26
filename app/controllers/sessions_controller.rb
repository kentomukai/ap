class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to root_path
    else
      # エラーメッセージを作成する
      flash.now[:danger] = '無効なメールアドレスとパスワードの組み合わせです。'
      render html: "残念でした！認証失敗です。笑"      
      #render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
