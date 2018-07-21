# frozen_string_literal: true

class ItemBase < ApplicationRecord
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

  validates :type, inclusion: { in: SUPPORTED_TYPES }
  validates :description, presence: true

  def listable?
    raise "Base class needs to implement #listable?"
  end
end
