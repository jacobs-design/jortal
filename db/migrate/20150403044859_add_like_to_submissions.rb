class AddLikeToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :like, :boolean, default: false
  end
end
