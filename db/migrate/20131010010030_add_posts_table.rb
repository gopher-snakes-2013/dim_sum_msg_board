class AddPostsTable < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.text :body
      t.belongs_to :discussion

      t.timestamps

    end
  end

  def down
    drop_table :posts
  end
end
