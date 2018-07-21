# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user), notice: 'All set!'
    else
      redirect_to "/#sign-up", error: 'Something is wrong!'
    end
  end

  def show
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email_address, :contact_number, :password)
  end
end
