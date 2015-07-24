class PersonasController < ApplicationController
  before_action :set_persona, only: [:show, :edit, :update, :destroy]
   layout "limpio", only: [:listado,:totales,:totales_municipio]
  # GET /personas
  # GET /personas.json

  def listado
   
    @resultado = Persona.all.order(:municipio)
  end


def totales_municipio
@arismendi_total_becas_u = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Beca Universitaria'").count
@arismendi_total_discapacidad = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Econ. Discapacidad'").count
@arismendi_total_operacion = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Operacion'").count
@arismendi_total_estudio_especializado = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Estudio Especializado'").count
@arismendi_total_medicinas = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Medicinas'").count
@arismendi_total_silla_ruedas = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Silla de Ruedas'").count
@arismendi_total_andadera = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Andadera'").count
@arismendi_total_baston = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Baston'").count
@arismendi_total_botas_ortopedicas = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Botas Ortopedicas'").count
@arismendi_total_cama = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Cama'").count
@arismendi_total_cama_clinica = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Cama Clinica'").count
@arismendi_total_colchon = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Colchon'").count
@arismendi_total_colchon_clinico = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Colchon Clinico'").count
@arismendi_total_colchon_anti = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Colchon Antiescaras'").count
@arismendi_total_lavadora = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Lavadora'").count
@arismendi_total_cocina = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Cocina'").count
@arismendi_total_nevera = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Nevera'").count
@arismendi_total_freezer = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Freezer'").count
@arismendi_total_hijos_vzla = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Hijos de Vzla'").count
@arismendi_total_amor_mayor = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Amor Mayor'").count
@arismendi_total_vivienda = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Vivienda'").count
@arismendi_total_kit_construccion = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Kit de material de construccion'").count
@arismendi_total_techo = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Techo'").count
@arismendi_total_tanque = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Tanque'").count
@arismendi_total_maquina_coser = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Maquina de Coser'").count
@arismendi_total_uniforme = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Uniformes'").count
@arismendi_total_kitdeportivo = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Kit deportivo'").count
@arismendi_total_pasaje = Persona.joins(:conclusions).where("personas.municipio= 'Arismendi' and conclusions.solicitud ='Pasaje(s)'").count



@marino_total_becas_e = Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Beca Educacion'").count
@marino_total_becas_u = Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Beca Universitaria'").count
@marino_total_discapacidad = Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Econ. Discapacidad'").count
@marino_total_operacion = Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Operacion'").count
@marino_total_estudio_especializado =Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Estudio Especializado'").count
@marino_total_medicinas = Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Medicinas'").count
@marino_total_silla_ruedas =Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Silla de Ruedas'").count
@marino_total_andadera = Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Andadera'").count
@marino_total_baston = Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Baston'").count
@marino_total_botas_ortopedicas = Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Botas Ortopedicas'").count
@marino_total_cama = Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Cama'").count
@marino_total_cama_clinica =Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Cama Clinica'").count
@marino_total_colchon = Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Colchon'").count
@marino_total_colchon_clinico =Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Colchon Clinico'").count
@marino_total_colchon_anti= Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Colchon Antiescaras'").count
@marino_total_lavadora = Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Lavadora'").count
@marino_total_cocina = Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Cocina'").count
@marino_total_nevera = Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Nevera'").count
@marino_total_freezer = Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Freezer'").count
@marino_total_hijos_vzla= Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Hijos de Vzla'").count
@marino_total_amor_mayor= Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Amor Mayor'").count
@marino_total_vivienda = Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Vivienda'").count
@marino_total_kit_construccion= Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Kit de material de construccion'").count
@marino_total_techo = Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Techo'").count
@marino_total_tanque = Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Tanque'").count
@marino_total_maquina_coser = Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Maquina de Coser'").count
@marino_total_uniforme = Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Uniformes'").count
@marino_total_kitdeportivo = Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Kit deportivo'").count
@marino_total_pasaje = Persona.joins(:conclusions).where("personas.municipio= 'Mariño' and conclusions.solicitud ='Pasaje(s)'").count


@maneiro_total_becas_e =Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Beca Educacion'").count
@maneiro_total_becas_u =Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Beca Universitaria'").count
@maneiro_total_discapacidad = Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Econ. Discapacidad'").count
@maneiro_total_operacion = Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Operacion'").count
@maneiro_total_estudio_especializado = Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Estudio Especializado'").count
@maneiro_total_medicinas = Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Medicinas'").count
@maneiro_total_silla_ruedas = Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Silla de Ruedas'").count
@maneiro_total_andadera = Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Andadera'").count
@maneiro_total_baston = Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Baston'").count
@maneiro_total_botas_ortopedicas = Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Botas Ortopedicas'").count
@maneiro_total_cama = Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Cama'").count
@maneiro_total_cama_clinica= Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Cama Clinica'").count
@maneiro_total_colchon = Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Colchon'").count
@maneiro_total_colchon_clinico =Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Colchon Clinico'").count
@maneiro_total_colchon_anti= Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Colchon Antiescaras'").count
@maneiro_total_lavadora = Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Lavadora'").count
@maneiro_total_cocina = Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Cocina'").count
@maneiro_total_nevera = Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Nevera'").count
@maneiro_total_freezer = Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Freezer'").count
@maneiro_total_hijos_vzla =Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Hijos de Vzla'").count
@maneiro_total_amor_mayor= Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Amor Mayor'").count
@maneiro_total_vivienda = Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Vivienda'").count
@maneiro_total_kit_construccion =Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Kit de material de construccion'").count
@maneiro_total_techo = Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Techo'").count
@maneiro_total_tanque = Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Tanque'").count
@maneiro_total_maquina_coser =Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Maquina de Coser'").count
@maneiro_total_uniforme = Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Uniformes'").count
@maneiro_total_kitdeportivo = Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Kit deportivo'").count
@maneiro_total_pasaje = Persona.joins(:conclusions).where("personas.municipio= 'Maneiro' and conclusions.solicitud ='Pasaje(s)'").count


@garcia_total_becas_e = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Beca Educacion'").count
@garcia_total_becas_u = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Beca Universitaria'").count
@garcia_total_discapacidad = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Econ. Discapacidad'").count
@garcia_total_operacion = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Operacion'").count
@garcia_total_estudio_especializado = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Estudio Especializado'").count
@garcia_total_medicinas = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Medicinas'").count
@garcia_total_silla_ruedas = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Silla de Ruedas'").count
@garcia_total_andadera = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Andadera'").count
@garcia_total_baston = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Baston'").count
@garcia_total_botas_ortopedicas = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Botas Ortopedicas'").count
@garcia_total_cama = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Cama'").count
@garcia_total_cama_clinica = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Cama Clinica'").count
@garcia_total_colchon = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Colchon'").count
@garcia_total_colchon_clinico = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Colchon Clinico'").count
@garcia_total_colchon_anti = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Colchon Antiescaras'").count
@garcia_total_lavadora = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Lavadora'").count
@garcia_total_cocina = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Cocina'").count
@garcia_total_nevera = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Nevera'").count
@garcia_total_freezer = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Freezer'").count
@garcia_total_hijos_vzla = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Hijos de Vzla'").count
@garcia_total_amor_mayor = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Amor Mayor'").count
@garcia_total_vivienda = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Vivienda'").count
@garcia_total_kit_construccion = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Kit de material de construccion'").count
@garcia_total_techo = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Techo'").count
@garcia_total_tanque = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Tanque'").count
@garcia_total_maquina_coser = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Maquina de Coser'").count
@garcia_total_uniforme = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Uniformes'").count
@garcia_total_kitdeportivo = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Kit deportivo'").count
@garcia_total_pasaje = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Pasaje(s)'").count


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
