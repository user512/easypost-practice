class Address < ActiveRecord::Base
  belongs_to :package
  validates :name, :street1, :city, :state, :zip, presence: true
end
