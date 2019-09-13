ActiveAdmin.register List do
  permit_params :name, :description, :category_id, :aasm_state

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :category_id
    column :aasm_state
    column :created_at
    column :updated_at
    actions
  end

  filter :name
  filter :description
  filter :category_id
  filter :aasm_state
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :category_id
      f.input :aasm_state
    end
    f.actions
  end
end
