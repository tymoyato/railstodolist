ActiveAdmin.register Category do
  permit_params :name, :user_id

  index do
    selectable_column
    id_column
    column :name
    column :user_id
    column :created_at
    column :updated_at
    actions
  end

  filter :name
  filter :created_at
  filter :id
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :user_id
    end
    f.actions
  end
end
