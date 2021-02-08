class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.references :kebab, null: false, foreign_key: true
      t.integer :bread_rating
      t.integer :fries_rating
      t.integer :meat_rating
      t.integer :sauces_rating
      t.integer :quantity_rating
      t.integer :quality_price_ratio
      t.integer :overall_rating

      t.timestamps
    end
  end
end
