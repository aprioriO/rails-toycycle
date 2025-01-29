class ToysController < ApplicationController

  def show
    @toy = Toy.find(params[:id])
  end

end
