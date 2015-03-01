class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :cid
      t.text :name

      t.timestamps
    end
  end
end
