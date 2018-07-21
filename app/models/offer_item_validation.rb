# frozen_string_literal: true

class OfferItemValidation < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :invalidation_reason, presence: true, if: :invalidated?

  validate :non_bidirectional

  def validated?
    validated_at.present?
  end

  def invalidated?
    invalidated_at.present?
  end

  private

  def non_bidirectional
    if validated? && invalidated?
      errors.add(:base, "can't be both validated and invalidated")
    end

    unless validated? || invalidated?
      errors.add(:base, "has to be either validated or invalidated")
    end
  end
end

