class Requirement < ActiveRecord::Base
  belongs_to :project
  attr_accessible :name, :order, :type
end
