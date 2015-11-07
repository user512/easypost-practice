class PackagesController < ApplicationController

  def index
  end


  def new
  end

  def history
    @packages = Package.all
  end

  def create
    to_address = Address.create(to_address_params)
    from_address = Address.create(from_address_params)

    begin
      Easypost.create_easypost_parcel(to_address, from_address, parcel_params)
      @postage_label = Easypost.buy_cheapest_easypost_postage
      @tracking_number = Easypost.get_tracking_number
    rescue Exception
      flash.notice = "PLEASE INPUT CORRECT ADDRESS TO PRINT POSTAGE LABEL"
      render template: "packages/new"
      return
    end

    package = Package.create(postage_label: @postage_label, tracking_number: @tracking_number)
    to_address.update(package_id: package.id)
    from_address.update(package_id: package.id)
    render template: "packages/index"
  end


  private
  def to_address_params
    {
      name: params[:recipient_name],
      company: params[:recipient_company],
      street1: params[:recipient_street_1],
      street2: params[:recipient_street_2],
      city: params[:recipient_city],
      state: params[:recipient_state],
      zip: params[:recipient_zip],
      phone: params[:sender_phone]
    }
  end

  def from_address_params
    {
      name: params[:sender_name],
      company: params[:sender_company],
      street1: params[:sender_street_1],
      street2: params[:sender_street_2],
      city: params[:sender_city],
      state: params[:sender_state],
      zip: params[:sender_zip]
    }
  end

  def parcel_params
    {
      length: params[:parcel_length],
      width: params[:parcel_width],
      height: params[:parcel_height],
      weight: params[:parcel_weight],
    }
  end
end
