class AddAasmStateToList < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :aasm_state, :string
  end
end
