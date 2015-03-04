class Requirement < ActiveRecord::Base
  attr_accessible :cid, :name, :order, :pid, :type
  belongs_to :project
  belongs_to :submission
end
