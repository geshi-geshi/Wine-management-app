class FavoritesController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :destroy]

  def index
    @user = current_user
    @favorites = @user.favorites.find_by(user_id: @user.id)
    @favorites_count = @user.favorites.where(user_id: @user.id).count
    @q = Wine.ransack(params[:q])
    @wines = @q.result(distinct: true).page(params[:page])
  end
  
  def create
    user = current_user
    wine = Wine.find(params[:id])
    favorite = Favorite.create(user_id: user.id, wine_id:wine.id)

    if favorite.save
      flash[:success] = "#{wine.name}をお気に入りに追加しました"
      redirect_to wines_url
    else
      flash[:success] = "#{wine.name}をお気に入りに追加できませんでした"
      redirect_to wines_url
    end
  end

  def destroy
    user = current_user
    wine = Wine.find(params[:id])
    if favorite=Favorite.find_by(user_id: user.id, wine_id:wine.id)
      favorite.delete
      flash[:success] = "#{wine.name}をお気に入りから解除しました"
      redirect_to favorites_url
    else
      flash[:success] = 'お気に入りを解除できませんでした'
      redirect_to favorites_url
    end
  end

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end
end
