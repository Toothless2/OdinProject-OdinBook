class ChangeFriendColNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :friends, 'user1_id', :sender
    rename_column :friends, 'user2_id', :recipient
  end
end
