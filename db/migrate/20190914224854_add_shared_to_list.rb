class AddSharedToList < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :shared_id, :integer, default: nil
  end
end
