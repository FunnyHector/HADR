# frozen_string_literal: true

class RequestItem < ItemBase
  belongs_to :request
  belongs_to :exchange

  def listable?
    true
  end
end
