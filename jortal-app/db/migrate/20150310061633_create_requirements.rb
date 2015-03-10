class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.string :name
      t.string :type
      t.integer :order
      t.references :project

      t.timestamps
    end
    add_index :requirements, :project_id
  end
end
