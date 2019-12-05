class WinesController < ApplicationController
  def new
  end

  def index
    @wines = Wine.paginate(page: params[:page])
  end

end
