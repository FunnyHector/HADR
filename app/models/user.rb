# frozen_string_literal: true

class User < ApplicationRecord
  has_many :requests
  has_many :offers
  has_many :offer_item_validations

  validates :email_address, presence: true, uniqueness: true

  validate :name_valid

  private

  def name_valid
    if first_name.blank? && last_name.blank? && preferred_name.blank?
      errors.add(:base, "one of first name, last name, or preferred name has to be present")
    end
  end
end

