class Word < ActiveRecord::Base
  after_create :add_tags
  has_and_belongs_to_many :tags
  belongs_to :member
  belongs_to :language

  attr_accessor :tag_ids
  after_create :add_tags
  after_update :update_tags
  def add_tags
    if tag_ids
      tag = Tag.find(tag_ids.to_a.drop(1))
      tags << tag
    end
  end

  def update_tags
    if tag_ids
      tag = Tag.find(tag_ids.to_a.drop(1))
      tags.destroy_all
      tags << tag
    end
  end
end