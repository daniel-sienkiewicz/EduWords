class Language < ActiveRecord::Base
  belongs_to :member
  has_many :words
  
  validates_presence_of  :name
  validates_length_of :name, :maximum => 20
end