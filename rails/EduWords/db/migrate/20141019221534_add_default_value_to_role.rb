class AddDefaultValueToRole < ActiveRecord::Migration
  def change
  	change_column :members, :role, :string, :default => "user"
  end
end
