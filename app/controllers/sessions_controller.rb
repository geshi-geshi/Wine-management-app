class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # log_inメソッドの機能で、ユーザーIDを一時的セッションの中に安全に記憶するようになる
      log_in(user)
      if user.email == "testadmin@sample.com"
        flash[:success] = '管理権限のテストユーザーでログインしました。'
      elsif user.email == "test@sample.com"
        flash[:success] = '一般権限のテストユーザーでログインしました。' 
      else
        flash[:success] = 'ログインしました。'
      end
      redirect_to(user)
    else
      # flash.now:リダイレクトはしないがフラッシュを表示したい時
      flash.now[:danger] = '認証に失敗しました。'
      render :new
    end
  end

  def destroy
    log_out
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
end
