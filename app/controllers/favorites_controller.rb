class FavoritesController < ApplicationController
  def index
    user = current_user
    # wine = Wine.find(params[:id])
    favorites = user.favorites.find_by(user_id: user.id)
    @q = Wine.ransack(params[:q])
    @wines = @q.result(distinct: true).page(params[:page])

  end
  def create
    user = current_user
    wine = Wine.find(params[:id])
    favorite = Favorite.create(user_id: user.id, wine_id:wine.id)

    if favorite.save
      flash[:success] = 'お気に入りに追加しました'
      redirect_to wines_url
    else
      flash[:success] = 'お気に入りに追加できませんでした'
      redirect_to wines_url
    end
  end

  def destroy
    user = current_user
    wine = Wine.find(params[:id])
    if favorite=Favorite.find_by(user_id: user.id, wine_id:wine.id)
      favorite.delete
      flash[:success] = 'お気に入りを解除しました'
      redirect_to wines_url
    else
      flash[:success] = 'お気に入りを解除できませんでした'
      redirect_to wines_url
    end
  end
end
