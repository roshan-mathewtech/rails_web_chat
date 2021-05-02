class AddNameToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :name, :string
  	add_column :users, :sign_out_at, :datetime
  end
end
