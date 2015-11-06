class Package < ActiveRecord::Base
  has_many :addresses
  validates :postage_label, presence: true
end
