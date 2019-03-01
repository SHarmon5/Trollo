class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :details
      t.boolean :complete
      t.belongs_to :list, foreign_key: true

      t.timestamps
    end
  end
end
