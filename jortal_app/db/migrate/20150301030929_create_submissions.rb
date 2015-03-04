class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :student_id
      t.text :content

      t.timestamps

      t.belongs_to :project
    end
  end
end
