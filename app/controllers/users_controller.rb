# frozen_string_literal: true

class UsersController < ApplicationController
  def create

  end

  private

  def user_params
    params.require(:user).permit(:name, :email_address, :contact_number, :password)
  end
end
