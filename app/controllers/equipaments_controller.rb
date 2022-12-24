class EquipamentsController < ApplicationController
  before_action :set_places, only: %i[create new edit update]
  before_action :set_equipament, only: %i[show edit destroy update]
  def index
    @equipaments = Equipament.page(params[:page])
    title_field = params[:title]
    if title_field.present?
      @equipaments = Equipament.for_title(title_field).page(params[:page])
    end
  end

  def new
    @equipament = Equipament.new
  end

  def create
    convert_kind
    @equipament = Equipament.new(equipament_params)
    if @equipament.save
      redirect_to equipaments_path, notice: 'equipament was successfully created'
    else
      render :new
    end
  end

  def show; end
  def edit; end

  def update
    convert_kind
    if @equipament.update(equipament_params)
      redirect_to equipaments_path, notice: 'equipament was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    begin
      @equipament.destroy
      redirect_to equipaments_path, notice: 'equipament was successfully destroyed'
    rescue ActiveRecord::DeleteRestrictionError
      flash[:error] = 'equipament was not destroyed'
      redirect_to equipaments_path
    end
  end

  private
  def convert_kind
    params[:equipament][:kind] = (params[:equipament][:kind]).to_i
  end
  def set_places
    @places = Place.all
  end
  def set_equipament
    @equipament = Equipament.find(params[:id])
  end

  def equipament_params
    params.require(:equipament).permit(:name, :brand, :kind, :picture, :place_id)
  end
end
