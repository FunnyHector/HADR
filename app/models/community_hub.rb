# frozen_string_literal: true

class CommunityHub < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :address, presence: true

end
