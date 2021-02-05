class AddAddressToKebab < ActiveRecord::Migration[6.0]
  def change
    add_column :kebabs, :address, :string
  end
end
