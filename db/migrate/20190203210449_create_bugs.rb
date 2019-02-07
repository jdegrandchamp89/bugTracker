class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :title
      t.text :description
      t.integer :issue_type, default: 3
      t.integer :priority, default: 2
      t.integer :status, default: 1

      t.timestamps null: false
    end
  end
end
