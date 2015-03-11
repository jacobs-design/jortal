class Submission < ActiveRecord::Base
  belongs_to :project
  attr_accessible :title, :desc, :content, :project_id
end
