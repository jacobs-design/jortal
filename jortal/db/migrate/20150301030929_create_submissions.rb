class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :pid
      t.integer :rid
      t.text :content

      t.timestamps
    end
  end
end
