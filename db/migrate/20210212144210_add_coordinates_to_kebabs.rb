class AddCoordinatesToKebabs < ActiveRecord::Migration[6.0]
  def change
    add_column :kebabs, :latitude, :float
    add_column :kebabs, :longitude, :float
  end
end
