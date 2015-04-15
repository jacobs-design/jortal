class User < ActiveRecord::Base
  attr_accessible :admin, :email, :name, :uid
  has_and_belongs_to_many :projects
  validates :email, presence: true
  validates :name, presence: true
  validates :uid, presence: true, uniqueness: true
end
