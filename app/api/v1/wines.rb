module V1
  class Wines < Grape::API
    resources :wines do
      desc 'returns all wines'
      get '/' do
        @wines = Wine.all 
      end

      # desc 'returns an wine'
      # params do
      #   requires :id, type: Integer
      # end
      # get '/:id' do
      #   @wine = Wine.find(params[:id])
      # end

      desc 'search an wine by name'
      params do
        requires :name, type: String
      end
      get '/:name' do
        @wine = Wine.where('name LIKE ?', "%#{params[:name]}%")
      end

      desc 'Create an wine'
      params do
        requires :name, type: String
      end
      post '/' do
        @user = Wine.create(name: params[:name])
      end

      # desc 'Delete an wine'
      # params do
      #   requires :id, type: Integer
      # end
      # delete '/:id' do
      #   @user = Wine.find(params[:id])
      #   @user.destroy
      # end
    end
  end
end