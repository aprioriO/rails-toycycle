class TradesController < ApplicationController

  def create
    @toy = Toy.find(params[:toy_id])
    @trade = Trade.new(trade_params)
    @trade.toy_trader = @toy
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

  private

  def trade_params
    params.require(:trade).permit(:toy_seeker_id)
  end
end
