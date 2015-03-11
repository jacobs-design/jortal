class AddAttachmentAttachmentToSubmissions < ActiveRecord::Migration
  def self.up
    change_table :submissions do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :submissions, :attachment
  end
end
