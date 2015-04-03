class User < ActiveRecord::Base
  attr_accessible :admin, :email, :name, :uid
  validates :email, presence: true
  validates :name, presence: true
  validates :uid, presence: true, uniqueness: true
end
