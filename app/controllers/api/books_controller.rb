class Api::BooksController < ApplicationController
  before_action :authenticate_api_user!
  include Wor::Paginate

  def index
    render_paginated Book, each_serializer: BookSerializer
  end

  def show
    render json: Book.find(params[:id])
  end
end
