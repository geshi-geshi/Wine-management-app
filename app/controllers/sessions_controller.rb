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
      redirect_to wines_url
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
  
  def sns_login  
    auth = request.env['omniauth.auth']
    if auth.present?
      user = User.find_or_create_from_auth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      if user.provider
        flash[:success] = "#{user.name}さんでログインしました"
      # elsif  user.provider = "facebook"
      #   flash[:success] = "facebook連携/#{user.name}さんでログインしました"
      elsif user.errors.any?
        flash[:danger] = "このアドレスは既に登録済みです"
      end
      redirect_to wines_url
    else
      redirect_to auth_failure_path
    end
  end
  
  #認証に失敗した際の処理
  def auth_failure 
    flash[:danger] = 'ログインできませんでした'
    redirect_to root_url
  end

end
