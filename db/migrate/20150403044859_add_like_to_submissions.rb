class AddLikeToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :like, :boolean
  end
end
