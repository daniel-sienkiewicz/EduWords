class TagsTests < ActiveRecord::Migration
  def self.up
	create_table :tags_tests, :id => false do |t|
		t.integer :test_id
		t.integer :tag_id
	end
  end

  def self.down
	drop_table :tags_tests
  end
end
