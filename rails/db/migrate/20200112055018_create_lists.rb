class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :title
      t.integer :sort_order
      t.references :dashboard, null: false, foreign_key: true

      t.timestamps
    end
  end
end
