# frozen_string_literal: true

class RequestItem < ApplicationRecord
  SUPPORTED_TYPES = %w[
    food
    medicine
    drinkable_water
    housing_and_shelter
    labour
    equipment
    short_range_transport
    clothes_and_blankets
    other
  ].freeze

  belongs_to :request
  belongs_to :exchange, optional: true

  validates :request_type, inclusion: { in: SUPPORTED_TYPES }

  def listable?
    true
  end
end
