class Project < ActiveRecord::Base
  attr_accessible :desc, :name
  has_many :submissions
  has_many :requirements
end
