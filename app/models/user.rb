class User < ActiveRecord::Base
  attr_accessible :admin, :email, :name, :uid
  validates :uid, presence: true, uniqueness: true
end
