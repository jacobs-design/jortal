class Project < ActiveRecord::Base
  attr_accessible :name
  belongs_to :course
  has_many :submissions
  has_many :requirements
end
