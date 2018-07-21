# frozen_string_literal: true

class Request < ApplicationRecord
  DELIVERY_OPTIONS = %w[
    delivery
    no_delivery
    at_community_hub
  ].freeze

  belongs_to :user
  has_many :request_items

  validates :location, presence: true
  validates :preferred_delivery_option, inclusion: { in: DELIVERY_OPTIONS }


end
