# frozen_string_literal: true

class OffersController < ApplicationController
  before_action :find_offer, only: [:show]
  before_action :sanitise_params, only: [:create]

  def create
    @offer = Offer.new(
      location: mock_location,
      preferred_delivery_option: mock_preferred_delivery_option,
      published_at: Time.now,
      user: mock_user
    )

    if @offer.save
      params[:offer].each do |offer_type, want|
        next if want == "0"

        @offer.offer_items.create!(offer_type: offer_type)
      end

      redirect_to offer_path(@offer)
    else
      redirect_to "/#offer-help-panel", error: 'Something is wrong!'
    end
  end

  def show
  end

  private

  def find_offer
    @offer = Offer.find(params[:id])
  end

  private

  def sanitise_params
    params.require(:offer).permit(*OfferItem::SUPPORTED_TYPES)
  end

  def mock_location
    "Te Aro"
  end

  def mock_preferred_delivery_option
    Offer::DELIVERY_OPTIONS.first
  end

  def mock_user
    User.last
  end
end
