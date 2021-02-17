ActiveAdmin.register Kebab do
  menu label: "Döners"
  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
  permit_params :name, :address, :description, :photo, :bread_category

  index do
    selectable_column
    column :id
    column :name
    column :address
    column :description
    column :bread_category
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :bread_category
      row :reviews
      row :photo do |kebab|
        avatar_for(kebab)
      end
    end
  end

  form do |f|
    f.inputs 'Kebab Details' do
      f.input :name
      f.input :address
      f.input :description
      f.input :bread_category
      f.input :photo, as: :file
    end
    f.actions
  end
end
