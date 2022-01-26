class Api::RentsController < ApplicationController
  before_action :authenticate_api_user!
  include Wor::Paginate

  def index
    render json: Rent.includes(:book, :user).where(user_id: params[:user_id])
  end

  def create
    @rent = Rent.new(rent_params)
    if @rent.save
      render json: @rent, status: :created
    else
      render json: @rent.errors
    end
  end

  private

  def rent_params
    params.require(:rent).permit(:user_id, :book_id, :start_rent, :end_rent)
  end
end
