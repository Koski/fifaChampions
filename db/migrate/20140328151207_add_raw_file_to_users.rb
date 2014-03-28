class AddRawFileToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :raw_file, :binary
  end
end
