class AddAasmStateToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :aasm_state, :string
  end
end
