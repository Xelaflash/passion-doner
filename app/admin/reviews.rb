ActiveAdmin.register Review do
  menu label: 'Reviews'
  permit_params :author, :kebab_id, :content, :bread_rating, :fries_rating, :meat_rating, :sauces_rating, :quantity_rating, :quality_price_ratio, :overall_rating
  index do
    selectable_column
    column :id
    column :kebab
    column :author
    column :content
    column :overall_rating
    column :bread_rating
    column :fries_rating
    column :meat_rating
    column :sauces_rating
    column :quantity_rating
    column :quality_price_ratio
    column :created_at
    column :updated_at
    actions
  end
end
