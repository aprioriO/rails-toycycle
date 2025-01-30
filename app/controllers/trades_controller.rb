class TradesController < ApplicationController
  before_action :set_trade, only: [:accept, :reject]

  def create
    @toy = Toy.find(params[:toy_id])
    @trade = Trade.new(trade_params)
    @trade.trader_toy = @toy
    @trade.trader = @toy.user
    @trade.seeker = current_user
    if @trade.save
      redirect_to dashboard_path
    else
      render "toys/show"
    end
  end

  def show
    @trade = Trade.find(params[:id])
    @trades = @toy.trades.where(user: current_user)
  end

  def accept
    @trade.update(status: "accepted")
    redirect_to dashboard_path, notice: "Trade accepted."
  end

  def reject
    @trade.update(status: "rejected")
    redirect_to dashboard_path, alert: "Trade rejected."
  end

  private

  def trade_params
    params.require(:trade).permit(:seeker_toy_id)
  end

  def set_trade
    @trade = Trade.find(params[:id])  # Fetching the trade by its ID
  end
end
