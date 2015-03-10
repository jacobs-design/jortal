class Submission < ActiveRecord::Base
  belongs_to :project
  attr_accessible :content
end
