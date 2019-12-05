class WinesController < ApplicationController

  def index
    @wines = Wine.paginate(page: params[:page])
  end

  def new
    @wine = Wine.new
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

  private

  def wine_params
    params.require(:wine).permit(:name, :color, :body, :country, :region, :area, :grape_variety, :appearance, :aroma, :taste, :production_year, :alcohol_content, :price, :detail)
  end

 

end
