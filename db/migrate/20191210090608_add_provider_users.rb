class AddProviderUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :username, :string
    add_column :users, :image_url, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_expires_at, :string
  end
end
