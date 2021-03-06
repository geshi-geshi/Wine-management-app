class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]

  # ユーザー自身のみが情報を編集・更新できる
  before_action :correct_user, only: [:edit, :show]
  # 管理者のみの機能
  before_action :admin_user, only: [:index, :destroy]

  def top
  end

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page])
  end

  def new
    @user = User.new
  end

  def show
    # @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user # 保存成功後、ログインします。
      flash[:success] = "#{@user.name}さんが登録されました。"
      redirect_to wines_url
    else
      render :new
    end
  end

  def create_by_twitter
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth']) # request.env['omniauth.auth']はTwitter認証で得た情報を格納するもの
    if user
      session[:user_id] = user.id
      redirect_to '/posts/index', notice: "ログインしました。"
    else
      redirect_to root_path, notice: "失敗しました。"
    end
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
    # @user = User.find(params[:id])
    if current_user.admin?
      if @user.update_attributes(user_params)
        flash[:success] = "#{@user.name}さんの情報を更新しました。"
        redirect_to users_url(@user)
      else
        render :edit
      end
    else
      if @user.update_attributes(user_params)
        flash[:success] = "ユーザー情報を更新しました。"
        redirect_to @user
      else
        render :edit
      end
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}さんのデータを削除しました。"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # beforeフィルター

  # paramsハッシュからユーザーを取得します。
  def set_user
    @user = User.find(params[:id])
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end

  # アクセスしたユーザーが現在ログインしているユーザーか確認します。
  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end

  # システム管理権限所有かどうか判定します。
  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  # システム管理権限所有かどうか判定します。
  def correct_user_or_admin_user
    redirect_to root_url unless current_user.admin? || current_user?(@user)
  end
end
