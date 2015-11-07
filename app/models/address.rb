class Address < ActiveRecord::Base
  belongs_to :package
  has_one :package
  before_validation :format_address
  validates :name, :street1, :city, :state, :zip, presence: true
  validates_inclusion_of :zip, :in => 10000..99999

  def format_address
    self.name = self.name.titleize
    self.street1 = self.street1.titleize
    self.street2 = self.street2.titleize
    self.city = self.city.titleize
    self.state = self.state.titleize
  end



end
