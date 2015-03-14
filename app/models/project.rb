class Project < ActiveRecord::Base
  attr_accessible :desc, :name
  has_many :submissions
  validates :desc, :name, presence: true
end
