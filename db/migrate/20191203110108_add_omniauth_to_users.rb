class AddOmniauthToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :name, :string
    add_column :users, :nickname, :string
    add_column :users, :description, :string
    add_column :users, :url, :string
    add_column :users, :image_url, :string
    add_column :users, :access_token, :string
    add_column :users, :access_secret, :string
    add_column :users, :credentials, :text
    add_column :users, :raw_info, :text
    add_column :users, :website, :text
  end
end
