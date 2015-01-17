class Sample < ActiveRecord::Base
  belongs_to :marker
  has_one :city, :through => :marker
end
