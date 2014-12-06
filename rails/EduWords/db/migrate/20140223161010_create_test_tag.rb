class CreateTestTag < ActiveRecord::Migration
  def self.up
	create_table :test_tag, :id => false do |t|
		t.integer :test_id
		t.integer :tag_id
	end
  end

  def self.down
	drop_table :test_tag
  end
end
