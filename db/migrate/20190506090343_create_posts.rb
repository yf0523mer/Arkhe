class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id        ,null: false
      t.string  :title          ,null: false
      t.text    :text           ,null: false
      t.integer :distance       ,null: false
      t.boolean :deleated       ,default: false

      t.timestamps
    end
  end
end
