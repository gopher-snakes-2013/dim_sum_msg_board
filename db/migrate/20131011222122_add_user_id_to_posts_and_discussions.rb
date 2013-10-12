class AddUserIdToPostsAndDiscussions < ActiveRecord::Migration
  def up
    add_column :discussions, :user_id, :integer
    add_column :posts, :user_id, :integer
  end

  def down
    remove_column :discussions, :user_id
    remove_column :posts, :user_id
  end
end
