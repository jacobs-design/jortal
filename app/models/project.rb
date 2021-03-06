class Project < ActiveRecord::Base
  attr_accessible :desc, :name
  has_many :submissions, dependent: :destroy
  has_and_belongs_to_many :users
  validates :desc, :name, presence: true
end
