class Project < ActiveRecord::Base
  attr_accessible :cid, :name
  belongs_to :course
  has_many :submissions
  has_many :requirements
end
