class BooksController < ApplicationController
  def index
    Book.all
  end

  def show
    Book.find(params[:id])
  end
end
