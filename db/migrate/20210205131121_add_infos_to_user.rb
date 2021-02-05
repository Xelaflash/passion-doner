class AddInfosToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :admin, :boolean
  end
end
