class Language < ActiveRecord::Base
  belongs_to :member
  has_many :words
end