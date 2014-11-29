class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :namelanguage1
      t.string :namelanguage2
      t.integer :member_id
      t.integer :language1_id
      t.integer :language2_id

      t.timestamps
    end
  end
end
