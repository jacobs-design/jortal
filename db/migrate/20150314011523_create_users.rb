class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :uid
      t.string :email
      t.boolean :admin

      t.timestamps
    end
  end
end
