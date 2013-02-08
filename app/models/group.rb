class Group < ActiveRecord::Base
  attr_accessible :active, :description, :title
  has_many :groups, :through => :memberships

end
