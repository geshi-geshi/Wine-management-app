class WinesController < ApplicationController
  # ログインしないとできない機能
  before_action :logged_in_user, only: [:new, :edit, :update, :destroy]


  def index
    @q = Wine.ransack(params[:q])
    @wines = @q.result(distinct: true).page(params[:page])
  end

  def new
    @wine = Wine.new
  end

  def show
    @wine = Wine.find(params[:id])
    @user = User.find(params[:id])

  end

  def create
    @wine = Wine.new(wine_params)
    if @wine.save
      flash[:success] = 'ワインを新規登録しました。'
      redirect_to wines_url 
    else
      render :new
    end
  end

  def edit
    @wine = Wine.find(params[:id])
  end

  def update
    @wine = Wine.find(params[:id])
    if @wine.update_attributes(wine_params)
      flash[:success] = "#{@wine.name}の情報を更新しました。"
    else
      flash[:danger] = "#{@wine.name}の更新に失敗しました。" + @base.errors.full_messages.join("。")
    end
    redirect_to wine_path(@wine)
  end

  def destroy
    @wine = Wine.find(params[:id])
    if @wine.destroy
      flash[:success] = "#{@wine.name}を削除しました。"
      redirect_to wines_url
    end
  end

  private

  def wine_params
    params.require(:wine).permit(:image, :name, :color, :body, :country, :region, :area, :grape_variety, :appearance, :aroma, :taste, :production_year, :alcohol_content, :price, :detail)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end

end
