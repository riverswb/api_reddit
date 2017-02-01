class UpdateUsersColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :token_expiration, :datetime
    add_column :users, :refresh_token, :text
    remove_column :users, :oauth_token_secret
  end
end
