class PersonasController < ApplicationController
  before_action :set_persona, only: [:show, :edit, :update, :destroy]
   layout "limpio", only: [:listado,:totales ]
  # GET /personas
  # GET /personas.json

  def listado
   
    @resultado = Persona.all.order(:municipio)
  end

  def totales
  

  @beca_educacion = Conclusion.where(:solicitud=> "Beca Educacion").count
  @beca_universitaria = Conclusion.where(:solicitud=> "Beca Universitaria").count
  @econ_Discapacidad= Conclusion.where(:solicitud=> "Econ. Discapacidad").count
  @operacion= Conclusion.where(:solicitud=> "Operacion").count
  @estudio_especializado= Conclusion.where(:solicitud=> "Estudio Especializado").count
  @medicinas= Conclusion.where(:solicitud=> "Medicinas").count
  @silla_de_ruedas=Conclusion.where(:solicitud=> "Silla de Ruedas").count
  @andadera=Conclusion.where(:solicitud=> "Andadera").count
  @baston=Conclusion.where(:solicitud=> "Baston").count
  @botas_ortopedicas=Conclusion.where(:solicitud=> "Botas Ortopedicas").count
  @protesis=Conclusion.where(:solicitud=> "Protesis").count
  @cama=Conclusion.where(:solicitud=> "Cama").count
  @cama_clinica=Conclusion.where(:solicitud=> "Cama Clinica").count
  @colchon=Conclusion.where(:solicitud=> "Colchon").count
  @colchon_clinico=Conclusion.where(:solicitud=> "Colchon Clinico").count
  @colchon_antiescaras=Conclusion.where(:solicitud=> "Colchon Antiescaras").count
  @lavadora=Conclusion.where(:solicitud=> "Lavadora").count
  @cocina=Conclusion.where(:solicitud=> "Cocina ").count
  @nevera=Conclusion.where(:solicitud=> "Nevera ").count
  @freezer=Conclusion.where(:solicitud=> "Freezer").count
  @hijos_de_vzla=Conclusion.where(:solicitud=> "Hijos de Vzla  ").count
  @amor_mayor=Conclusion.where(:solicitud=> "Amor Mayor").count
  @vivienda=Conclusion.where(:solicitud=> "Vivienda").count
  @kit_construccion=Conclusion.where(:solicitud=> "Kit de material de construccion").count
  @techo=Conclusion.where(:solicitud=> "Techo").count
  @tanque=Conclusion.where(:solicitud=> "Tanque").count
  @maquina_coser=Conclusion.where(:solicitud=> "Maquina de Coser").count
  @uniformes=Conclusion.where(:solicitud=> "Uniformes").count
  @kit_deportivo=Conclusion.where(:solicitud=> "Kit deportivo").count
  @pasajes=Conclusion.where(:solicitud=> "Pasaje(s)").count

@totales = @beca_educacion+@beca_universitaria+@econ_Discapacidad+@operacion+@estudio_especializado+@medicinas+@silla_de_ruedas+@andadera+@baston+@botas_ortopedicas+@protesis+@cama+@cama_clinica+@colchon+@colchon_clinico+@colchon_antiescaras+@lavadora+@cocina+@nevera+@freezer+@hijos_de_vzla+@amor_mayor+@vivienda+@kit_construccion+@techo+@tanque+@maquina_coser+@uniformes+@kit_deportivo+@pasajes

  end

  def index
    @personas = Persona.all
  end

  # GET /personas/1
  # GET /personas/1.json
  def show
  end

  # GET /personas/new
  def new
    @persona = Persona.new
    @persona.build_economy
   3.times { @persona.conclusions.build  }

  end

  # GET /personas/1/edit
  def edit
   # @persona.conclusions.build  
  end

  # POST /personas
  # POST /personas.json
  def create
    @persona = Persona.new(persona_params)

    respond_to do |format|
      if @persona.save
        format.html { redirect_to @persona, notice: 'Persona was successfully created.' }
        format.json { render :show, status: :created, location: @persona }
      else
        format.html { render :new }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personas/1
  # PATCH/PUT /personas/1.json
  def update
    respond_to do |format|
      if @persona.update(persona_params)
        format.html { redirect_to @persona, notice: 'Persona was successfully updated.' }
        format.json { render :show, status: :ok, location: @persona }
      else
        format.html { render :edit }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personas/1
  # DELETE /personas/1.json
  def destroy
    @persona.destroy
    respond_to do |format|
      format.html { redirect_to personas_url, notice: 'Persona was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_persona
      @persona = Persona.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def persona_params
      params.require(:persona).permit(:nombre1, :nombre2, :apellido1, :apellido2, :cedula, :direccion, :referencia, :municipio, :parroquia, :telefono1, :telefono2,  economy_attributes: [:sector,:empresa,:ingreso_familiar,:tipo_casa,:condiciones_de_vivienda,:persona_hab,:cant_hijos,:enceres_compartidos,:adultos_mayores,:discapacitados,:enfermos,:pobreza_extrema, :descripcion],conclusions_attributes: [:solicitud,:estado,:fecha,:_destroy])

    end
end
#:economy[:sector,:empresa,:ingreso_familiar,:tipo_casa,:condiciones_de,:persona_hab,:cant_hijos,:enceres_compartidos,:adultos_mayores,:discapacitados,:enfermos]
