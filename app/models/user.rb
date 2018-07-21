# frozen_string_literal: true

class User < ApplicationRecord
  has_many :requests
  has_many :offers
  has_many :offer_item_validations

  validates :email_address, presence: true, uniqueness: true

  # TODO: format validation on password
  validates :password, presence: true, uniqueness: true

  def verified?
    # TODO: email_verified_at.present?
    true
  end
end
