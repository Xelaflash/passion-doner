class AddSlugToKebabs < ActiveRecord::Migration[6.0]
  def change
    add_column :kebabs, :slug, :string
    add_index :kebabs, :slug, unique: true
  end
end
