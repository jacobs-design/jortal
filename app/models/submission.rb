class Submission < ActiveRecord::Base
  belongs_to :project
  attr_accessible :title, :desc, :attachment, :project_id
  has_attached_file :attachment
  # TODO: validate content type or else get pwned!!! read on github/thoughtbot/paperclip
  do_not_validate_attachment_file_type :attachment
  validates :title, presence: true
  validates :desc, presence: true
  validates :attachment, presence: true
end
