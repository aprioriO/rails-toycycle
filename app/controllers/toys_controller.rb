class ToysController < ApplicationController

  def show
    @toy = Toy.find(params[:id])
    @trade = Trade.new

    @markers = [{
        lat: @toy.latitude,
        lng: @toy.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {toy: @toy}),
        marker_html: render_to_string(partial: "marker")
      }]
  end

  def index
    if params[:category].present?
      @toys = Toy.where(category: params[:category])  # Filters by category
    else
      @toys = Toy.all  # else shows ALL toys
    end


    @toys = if params[:category].present?
      Toy.where(category: params[:category])
    else
      Toy.all
    end

    @markers = @toys.geocoded.map do |toy|
      {
        lat: toy.latitude,
        lng: toy.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {toy: toy}),
        marker_html: render_to_string(partial: "marker")
      }
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
