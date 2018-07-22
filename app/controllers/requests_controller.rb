# frozen_string_literal: true

class RequestsController < ApplicationController
  before_action :find_user, only: [:show]
  before_action :sanitise_params, only: [:create]

  def create
    @request = Request.new(
      location: mock_location,
      preferred_delivery_option: mock_preferred_delivery_option,
      published_at: Time.now,
      user: mock_user
    )

    if @request.save
      params[:request].each do |request_type, want|
        next if want == "0"

        @request.request_items.create!(request_type: request_type)
      end

      redirect_to request_path(@request)
    else
      binding.pry

      redirect_to "/#find-help-panel", error: 'Something is wrong!'
    end
  end

  def show
  end

  private

  def find_user
    @request = Request.find(params[:id])
  end

  private

  def sanitise_params
    params.require(:request).permit(*RequestItem::SUPPORTED_TYPES)
  end

  def mock_location
    "Te Aro"
  end

  def mock_preferred_delivery_option
    Request::DELIVERY_OPTIONS.first
  end

  def mock_user
    User.last
  end
end
