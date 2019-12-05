class WinesController < ApplicationController
  def new
    @wine = Wine.new
  end

  def index
    @wines = Wine.paginate(page: params[:page])
  end

end
