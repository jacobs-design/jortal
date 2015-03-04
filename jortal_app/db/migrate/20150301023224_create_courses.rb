class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :short_name
      t.string :long_name
      t.text :description

      t.timestamps

    end
  end
end
