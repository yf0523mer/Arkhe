class RenameDeleatedColumnToUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :deleated, :deleted
  end
end
