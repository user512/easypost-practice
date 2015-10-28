class EasypostsController < ApplicationController
  require 'easypost'
  EasyPost.api_key = ENV["EASYPOST_KEY"]

  def create

    begin
      shipment = EasyPost::Shipment.create(
      {
        to_address: {
          name: params[:recipient_name],
          company: params[:recipient_company],
          street1: params[:recipient_street_1],
          street2: params[:recipient_street_2],
          city: params[:recipient_city],
          state: params[:recipient_state],
          zip: params[:recipient_zip]
          },
          from_address: {
            name: params[:sender_name],
            company: params[:sender_company],
            street1: params[:sender_street_1],
            street2: params[:sender_street_2],
            city: params[:sender_city],
            state: params[:sender_state],
            zip: params[:sender_zip],
            phone: params[:sender_phone]
            },
            parcel: {
              length: params[:parcel_length].to_i,
              width: params[:parcel_width].to_i,
              height: params[:parcel_height].to_i,
              weight: params[:parcel_weight].to_i
            }
          }
          )

      shipment.buy(
        :rate => shipment.lowest_rate(carriers = ['USPS']))
      @postage_label = shipment.postage_label.label_url
      render template: "packages/index"

    rescue Exception
      flash.notice = "PLEASE INPUT CORRECT ADDRESS TO PRINT POSTAGE LABEL"
      render template: "packages/new"

    end
  end
end