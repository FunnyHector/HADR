# frozen_string_literal: true

class Offer < ApplicationRecord
  DELIVERY_OPTIONS = %w[
    delivery
    no_delivery
    at_community_hub
  ].freeze

  belongs_to :user
  has_many :offer_items

  validates :location, presence: true
  validates :preferred_delivery_option, inclusion: { in: DELIVERY_OPTIONS }
  validates :published_at, presence: true

  def pre_disaster?(disaster_time:)
    published_at < disaster_time
  end
end
