class User < ActiveRecord::Base
  attr_accessible :admin, :email, :name, :uid
  validates_uniqueness_of :uid
end
