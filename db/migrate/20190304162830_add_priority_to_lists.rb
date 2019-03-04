class AddPriorityToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :priority, :integer
  end
end
