class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :howtouse ]

  def home

  end

  def about

  end

  def howtouse

  end

  def dashboard

  end

end
