class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password]) # パスワードの認証
      session[:user_id] = user.id # セッションにユーザーIDを保存
      redirect_to home_path, notice: 'ログインしました' # home_pathにリダイレクト
    else
      flash.now[:alert] = 'ユーザー名またはパスワードが無効です'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil # セッションをクリア
    redirect_to root_path, notice: 'ログアウトしました', status: :see_other
  end
end
