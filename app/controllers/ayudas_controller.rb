class AyudasController < ApplicationController
  before_action :set_ayuda, only: [:show, :edit, :update, :destroy]

  # GET /ayudas
  # GET /ayudas.json
  def index
    @ayudas = Ayuda.all
  end

  # GET /ayudas/1
  # GET /ayudas/1.json
  def show
  end

  # GET /ayudas/new
  def new
    @ayuda = Ayuda.new
  end

  # GET /ayudas/1/edit
  def edit
  end

  # POST /ayudas
  # POST /ayudas.json
  def create
    @ayuda = Ayuda.new(ayuda_params)

    respond_to do |format|
      if @ayuda.save
        format.html { redirect_to @ayuda, notice: 'Ayuda was successfully created.' }
        format.json { render :show, status: :created, location: @ayuda }
      else
        format.html { render :new }
        format.json { render json: @ayuda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ayudas/1
  # PATCH/PUT /ayudas/1.json
  def update
    respond_to do |format|
      if @ayuda.update(ayuda_params)
        format.html { redirect_to @ayuda, notice: 'Ayuda was successfully updated.' }
        format.json { render :show, status: :ok, location: @ayuda }
      else
        format.html { render :edit }
        format.json { render json: @ayuda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ayudas/1
  # DELETE /ayudas/1.json
  def destroy
    @ayuda.destroy
    respond_to do |format|
      format.html { redirect_to ayudas_url, notice: 'Ayuda was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ayuda
      @ayuda = Ayuda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ayuda_params
      params.require(:ayuda).permit(:nombre)
    end
end
