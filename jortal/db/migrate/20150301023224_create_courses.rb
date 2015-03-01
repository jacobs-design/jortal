class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.text :short_name
      t.text :long_name
      t.text :description

      t.timestamps
    end
  end
end
