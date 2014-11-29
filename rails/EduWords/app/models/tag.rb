class Tag < ActiveRecord::Base
  has_and_belongs_to_many :words
  has_and_belongs_to_many :tests
  belongs_to :member
end
