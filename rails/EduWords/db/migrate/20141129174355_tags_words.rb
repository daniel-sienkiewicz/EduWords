class TagsWords < ActiveRecord::Migration
  def change
        create_table :tags_words, id: false do |t|
       t.references :tag
       t.references :word
     end
     add_index :tags_words, :tag_id
     add_index :tags_words, :word_id
  end
end
