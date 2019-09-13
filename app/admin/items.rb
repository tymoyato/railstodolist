ActiveAdmin.register Item do
  permit_params :name, :description, :list_id, :user_id, :aasm_state

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :list_id
    column :user_id
    column :aasm_state
    column :created_at
    column :updated_at
    actions
  end

  filter :name
  filter :description
  filter :list_id
  filter :user_id
  filter :aasm_state
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :category_id
      f.input :user_id
      f.input :aasm_state
    end
    f.actions
  end
end