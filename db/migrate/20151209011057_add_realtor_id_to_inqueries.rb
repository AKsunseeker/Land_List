class AddRealtorIdToInqueries < ActiveRecord::Migration
  def change
    add_column :inqueries, :realtor_id, :integer
  end
end
