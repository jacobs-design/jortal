class Course < ActiveRecord::Base
  attr_accessible :description, :long_name, :short_name
end
