class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :title
      t.text :description
      t.integer :sort_order
      t.references :list, null: false, foreign_key: true, index: true
      t.references :assignee, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
