class Package < ActiveRecord::Base
  has_many :addresses
  validates :postage_label, presence: true
  validates_format_of :postage_label, :with => URI::regexp(%w(http https))
end
