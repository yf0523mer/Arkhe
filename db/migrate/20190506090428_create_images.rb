class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.integer :post_id        ,null: false
      t.text :image_id          ,null: false

      t.timestamps
    end
  end
end
