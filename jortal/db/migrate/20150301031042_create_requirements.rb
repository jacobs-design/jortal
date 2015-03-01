class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.integer :cid
      t.integer :pid
      t.string :name
      t.string :type
      t.integer :order

      t.timestamps
    end
  end
end
