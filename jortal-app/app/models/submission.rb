class Submission < ActiveRecord::Base
  belongs_to :project
  attr_accessible :content, :project_id
end
