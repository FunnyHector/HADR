# frozen_string_literal: true

class HomepageController < ActionController::Base
  PAGE_TITLE = "Hono"

  layout "application"

  def index
    @page_title = PAGE_TITLE
  end
end
