class ChangeUsersColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :token_expiration, :string
  end
end
