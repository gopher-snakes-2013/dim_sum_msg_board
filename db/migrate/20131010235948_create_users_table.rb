class CreateUsersTable < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :username
      t.string :password_hash
      t.string :acct_type

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
