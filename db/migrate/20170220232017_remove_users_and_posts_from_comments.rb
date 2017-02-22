class RemoveUsersAndPostsFromComments < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :user, index: true, foreign_key: true
    remove_column :comments, :post, index: true, foreign_key: true
  end
end
