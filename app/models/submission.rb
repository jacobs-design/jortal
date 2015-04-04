class Submission < ActiveRecord::Base
  belongs_to :project

  mount_uploader :attachment, AttachmentUploader

  attr_accessible :title, :desc, :attachment, :project_id
  validates :title, presence: true
  validates :desc, presence: true
  validates :attachment, presence: true

end
