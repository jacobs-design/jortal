class Submission < ActiveRecord::Base
  belongs_to :project

  mount_uploader :attachment, AttachmentUploader

  attr_accessible :title, :desc, :attachment, :project_id, :like, :name
  validates :title, presence: true
  validates :desc, presence: true
  validates :name, presence: true
  validates :attachment, presence: true
end
