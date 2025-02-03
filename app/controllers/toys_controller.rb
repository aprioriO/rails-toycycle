class ToysController < ApplicationController

  def show
    @toy = Toy.find(params[:id])
    @trade = Trade.new
    @trades = Trade.where(seeker_toy_id: @toy.id).or(Trade.where(trader_toy_id: @toy.id))
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

  def create
    @toy = Toy.new(toy_params)
    @toy.user = current_user
    if @toy.save!
      redirect_to @toy, notice: "Toy created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def toy_params
    params.require(:toy).permit(:name, :location, :category, :description, :need_in_return, :condition, :photo)
  end
end
