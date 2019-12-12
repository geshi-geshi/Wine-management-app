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
      # params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
      # redirect_to(user)
    else
      # flash.now:リダイレクトはしないがフラッシュを表示したい時
      flash.now[:danger] = '認証に失敗しました。'
      render :new
    end
  end

  def destroy
    # ログイン中の場合のみログアウト処理を実行します。
    log_out if logged_in?
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end

  def twitter
    user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    # byebug
    # log_in(user)

    session[:user_id] = user.id
    
    flash[:success] = "#{user.password}さんでログインしました"
    # log_in(user)
    redirect_to(user)
  end


end
