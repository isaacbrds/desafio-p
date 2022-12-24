class PlacesController < ApplicationController
  before_action :set_places, only: %i[create new edit update]
  before_action :set_place, only: %i[show edit destroy update]
  def index
    @places = Place.page(params[:page])
    title_field = params[:title]
    if title_field.present?
      @places = Place.for_title(title_field).page(params[:page])
    end
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to places_path, notice: 'place was successfully created'
    else
      render :new
    end
  end

  def show; end
  def edit; end

  def update
    if @place.update(place_params)
      redirect_to places_path, notice: 'place was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    begin
      @place.destroy
      redirect_to places_path, notice: 'place was successfully destroyed'
    rescue ActiveRecord::DeleteRestrictionError
      flash[:error] = 'place was not destroyed'
      redirect_to places_path
    end
  end

  private
  def set_places
    @places = Place.all
  end
  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :brand, :kind, :picture)
  end
end
