class RemoveUsersAndPostsFromComments < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :user
    remove_column :comments, :post
  end
end
