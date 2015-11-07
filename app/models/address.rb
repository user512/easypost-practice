class Address < ActiveRecord::Base
  belongs_to :package
  has_one :package
  validates :name, :street1, :city, :state, presence: true
  validates_inclusion_of :zip, :in => 10000..99999

  # def format_address
  #   self.name = self.name.split.map(&:capitalize).join(' ')
  #   self.street1 = self.street1.split.map(&:capitalize).join(' ')
  #   self.street2 = self.street2.split.map(&:capitalize).join(' ')
  #   self.city = self.city.split.map(&:capitalize).join(' ')
  #   self.state = self.state.split.map(&:capitalize).join(' ')
  # end



end
