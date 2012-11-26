class RemoveUserIdFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :UserId
  end

  def down
    add_column :posts, :UserId, :integer
  end
end
