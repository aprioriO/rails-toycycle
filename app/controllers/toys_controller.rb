class ToysController < ApplicationController

  def show
    @toy = Toy.find(params[:id])
    @trade = Trade.new
  end

  def index
    if params[:category].present?
      @toys = Toy.where(category: params[:category])  # Filters by category
    else
      @toys = Toy.all  # else shows ALL toys
    end
  end

  def new
    @toy = Toy.new
  end

end
