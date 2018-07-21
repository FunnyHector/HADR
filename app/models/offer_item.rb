# frozen_string_literal: true

class OfferItem < ItemBase
  belongs_to :offer
  belongs_to :exchange
  has_one :offer_item_validation

  delegate :validated?, :invalidated?, to: :offer_item_validation

  def listable?
    if offer_item_validation.present?
      !invalidated?
    else
      true
    end
  end
end
