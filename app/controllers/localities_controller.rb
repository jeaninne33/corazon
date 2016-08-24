class LocalitiesController < ApplicationController
  before_action :set_locality, only: [:show, :edit, :update, :destroy]

  def index
    @localities = Locality.all.order("fecha DESC").page(params[:page]).per(20)
      if params[:search]
        @localities = Locality.search(params[:search]).order("fecha DESC").page(params[:page]).per(20)
      else
        @localities = Locality.all.order('fecha DESC').page(params[:page]).per(20)
      end
  end

  def show
  end

  def new
    @locality = Locality.new
  end

  def edit
  end

  def create
    @locality = Locality.new(locality_params)

    respond_to do |format|
      if @locality.save
        format.html { redirect_to @locality, notice: 'La localidad ha sido almacenada exitosamente.' }
        format.json { render :show, status: :created, location: @locality }
      else
        format.html { render :new }
        format.json { render json: @locality.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @locality.update(locality_params)
        format.html { redirect_to @locality, notice: 'La localidad ha sido actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @locality }
      else
        format.html { render :edit }
        format.json { render json: @locality.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @locality.destroy
    respond_to do |format|
      format.html { redirect_to localities_url, notice: 'La localidad ha sido eliminada exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    def set_locality
      @locality = Locality.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def locality_params
      params.require(:locality).permit(:municipio, :sector, :fecha, :activo)
    end
end
