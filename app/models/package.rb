class Package < ActiveRecord::Base
  has_many :addresses
end
