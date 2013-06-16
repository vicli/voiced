class AddShizzleToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :profile_image, :string
  	add_column :users, :friendships, :integer
  	add_column :users, :inverse_friendships, :integer	
  end
end
