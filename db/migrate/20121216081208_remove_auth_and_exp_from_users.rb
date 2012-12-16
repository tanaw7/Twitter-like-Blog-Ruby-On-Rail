class RemoveAuthAndExpFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :add_oauthToken_to_users
    remove_column :users, :add_oauthExpiresAt
  end

  def down
    add_column :users, :add_oauthExpiresAt, :datetime
    add_column :users, :add_oauthToken_to_users, :string
  end
end
