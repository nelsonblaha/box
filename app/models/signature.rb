class Signature < ActiveRecord::Base
  attr_accessible :content, :id, :title
  belongs_to :user
end
