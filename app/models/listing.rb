class Listing < ActiveRecord::Base
  has_many :inqueries
  belongs_to :realtor

  has_attached_file :avatar, styles: { medium: "500x500>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
