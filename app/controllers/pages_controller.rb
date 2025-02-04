class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :howtouse ]

  def home

  end

  def about

  end

  def howtouse

  end

  def dashboard
    @trades = Trade.where("seeker_id = ? OR trader_id = ?", current_user.id, current_user.id)
  end

end
