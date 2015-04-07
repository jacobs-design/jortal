class Submission < ActiveRecord::Base
  belongs_to :project

  mount_uploader :attachment, AttachmentUploader, :mount_on => :attachment

  attr_accessible :title, :desc, :attachment, :project_id, :like
  validates :title, presence: true
  validates :desc, presence: true
  validates :attachment, presence: true
end
