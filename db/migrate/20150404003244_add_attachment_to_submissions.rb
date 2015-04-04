class AddAttachmentToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :attachment, :string
  end
end
