class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :comment_karma, :integer
    add_column :users, :link_karma, :integer
  end
end
