class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.integer :post_id        ,null: false
      t.text :latitude          ,null: false
      t.text :longitude         ,null: false
      t.integer :order

      t.timestamps
    end
  end
end
