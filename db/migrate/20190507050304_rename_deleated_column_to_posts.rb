class RenameDeleatedColumnToPosts < ActiveRecord::Migration[5.2]
  def change
  	rename_column :posts, :deleated, :deleted
  end
end
