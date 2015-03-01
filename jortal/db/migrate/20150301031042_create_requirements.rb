class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.string :name
      t.string :type
      t.integer :order

      t.timestamps

      t.belongs_to :project
      t.belongs_to :submission
      t.belongs_to :course, through: :project
    end
  end
end
