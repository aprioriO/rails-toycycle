class TradesController < ApplicationController
  before_action :set_trade, only: [:accept, :reject]

  def create
    @toy = Toy.find(params[:toy_id])
    @trade = Trade.new(trade_params)
    @trade.trader_toy = @toy
    @trade.trader = @toy.user
    @trade.seeker = current_user
    if @trade.save
      Rails.logger.debug "✅ Trade created successfully!"
      redirect_to dashboard_path, notice: "Trade request sent!"
    else
      Rails.logger.debug "❌ Trade creation failed: #{@trade.errors.full_messages}"
      flash[:alert] = "Failed to request trade: #{@trade.errors.full_messages.join(', ')}"
      render "toys/show", status: :unprocessable_entity
    end
  end

  def show
    @trade = Trade.find(params[:id])
    @trades = Trade.where(seeker_id: current_user).or(Trade.where(trader_id: current_user))
    @message = Message.new
  end

  def accept
    if @trade.update(status: "accepted")
      # Mark both toys as unavailable
      @trade.seeker_toy.update(status: "unavailable")
      @trade.trader_toy.update(status: "unavailable")
      flash[:notice] = "Trade accepted!"
    else
      flash[:alert] = "Something went wrong."
    end
    redirect_to dashboard_path, notice: "Trade accepted."
  end

  def reject
    if @trade.update(status: :rejected)
      flash[:notice] = "Trade rejected!"
    else
      flash[:alert] = "Something went wrong."
    end
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
