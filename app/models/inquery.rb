class Inquery < ActiveRecord::Base
  belongs_to :listing
  belongs_to :realtor
end
