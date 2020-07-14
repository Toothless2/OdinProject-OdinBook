class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.references :user1, foreign_key: true
      t.references :user2, foreign_key: true

      t.timestamps
    end
  end
end
