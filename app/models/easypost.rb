class Easypost
  require 'easypost'
  EasyPost.api_key = ENV["EASYPOST_KEY"]

  def self.create_easypost_parcel(to_address, from_address, parcel_params)
    @shipment = EasyPost::Shipment.create(
    {
      to_address: {
        name: to_address.name,
        company: to_address.company,
        street1: to_address.street1,
        street2: to_address.street2,
        city: to_address.city,
        state: to_address.state,
        zip: to_address.zip
        },
        from_address: {
          name: from_address.name,
          company: from_address.company,
          street1: from_address.street1,
          street2: from_address.street2,
          city: from_address.city,
          state: from_address.state,
          zip: from_address.zip,
          phone: from_address.phone
          },
          parcel: parcel_params
        }
        )
  end

  def self.buy_cheapest_easypost_postage
    @shipment.buy(:rate => @shipment.lowest_rate(carriers = ['USPS']))
    @shipment.postage_label.label_url
  end

  def self.get_tracking_number
    @shipment.tracking_code
  end

end
