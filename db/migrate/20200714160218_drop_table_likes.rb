class DropTableLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.integer :sender
      t.integer :recipient

      t.timestamps
    end
  end
end
