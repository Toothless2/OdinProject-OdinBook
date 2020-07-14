class Addrelations < ActiveRecord::Migration[5.2]
  def change
    create_table :relations do |t|
      t.references :user
      t.references :pal

      t.timestamps
    end
  end
end
