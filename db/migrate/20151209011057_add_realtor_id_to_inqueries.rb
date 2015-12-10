class AddRealtorIdToInqueries < ActiveRecord::Migration
  def change
    add_column :inqueries, :realtor_id, :integer
    add_column :inqueries, :listing_id, :integer
  end
end
