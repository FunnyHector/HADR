# frozen_string_literal: true

class User < ApplicationRecord
  has_many :requests
  has_many :offers
  has_many :offer_item_validations

  validates :email_address, presence: true, uniqueness: true

  # TODO: format validation on password
  validates :password, presence: true, uniqueness: true

end
