class ChangeFriendToReference < ActiveRecord::Migration[5.2]
  def change
    remove_column :friends, :sender, :reference
    add_column :friends, :sender, :integer,references: :users

    remove_column :friends, :recipient, :reference
    add_column :friends, :recipient, :integer, references: :users
  end
end
