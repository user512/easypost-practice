class Address < ActiveRecord::Base
  belongs_to :package
  has_one :package
  validates :name, :street1, :city, :state, presence: true
  validates_inclusion_of :zip, :in => 10000..99999
  before_validation :format_address

  def format_address
    self.name = self.name.titleize
    self.street1 = self.street1.titleize
    self.street2 = self.street2.titleize
    self.city = self.city.titleize
    self.state = self.state.titleize
  end



end
