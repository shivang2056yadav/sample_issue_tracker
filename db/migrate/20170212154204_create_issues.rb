class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.string :subject
      t.text :description
      t.integer :assigned_to_id

      t.timestamps
    end
  end
end
