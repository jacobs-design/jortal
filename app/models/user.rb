class User < ActiveRecord::Base
  attr_accessible :admin, :email, :name, :uid
end
