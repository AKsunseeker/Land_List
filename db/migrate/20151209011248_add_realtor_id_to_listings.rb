class AddRealtorIdToListings < ActiveRecord::Migration
  def change
    add_column :listings, :realtor_id, :integer
  end
end
