class Listing < ActiveRecord::Base
  has_many :inqueries
  belongs_to :realtor
end
