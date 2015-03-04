class Submission < ActiveRecord::Base
  attr_accessible :content, :pid, :rid
  belongs_to :project
  has_one :requirement
end
