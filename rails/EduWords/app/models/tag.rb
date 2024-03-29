class Tag < ActiveRecord::Base
  has_and_belongs_to_many :words
  has_and_belongs_to_many :tests
  belongs_to :member
  
  validates_presence_of  :name
  validates_length_of :name, :maximum => 20
end
