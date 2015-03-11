class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :title
      t.text :desc
      t.text :content
      t.references :project

      t.timestamps
    end
    add_index :submissions, :project_id
  end
end
