# frozen_string_literal: true

class Exchange < ApplicationRecord
  has_one :offer_item
  has_one :request_item

  def offerer
    offer_item.offer.user
  end

  def requester
    request_item.request.user
  end
end
