class AddListingIdToInqueries < ActiveRecord::Migration
  def change
    add_column :inqueries, :listing_id, :integer
  end
end
