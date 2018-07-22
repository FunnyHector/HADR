# frozen_string_literal: true

class OfferItem < ApplicationRecord
  SUPPORTED_TYPES = %w[
    food
    medicine
    water
    housing_and_shelter
    labour
    equipment
    short_range_transport
    clothes_and_blankets
    other
  ].freeze

  belongs_to :offer
  belongs_to :exchange, optional: true
  has_one :offer_item_validation, optional: true

  validates :offer_type, inclusion: { in: SUPPORTED_TYPES }

  delegate :validated?, :invalidated?, to: :offer_item_validation

  def listable?
    if offer_item_validation.present?
      !invalidated?
    else
      true
    end
  end
end
