class PersonasController < ApplicationController
  before_action :set_persona, only: [:show, :edit, :update, :destroy]
   layout "limpio", only: [:listado,:totales,:totales_municipio]
   layout "limpio", only: [:listado,:totales ]
  # GET /personas
  # GET /personas.json

  def listado
   
    @resultado = Persona.all.order(:municipio)
  end

  def reporte_diario
  	
  	
  end



#"SELECT  `personas` . * FROM  `personas` INNER JOIN  `conclusions` ON  `conclusions`.`persona_id` =  `personas`.`id` WHERE (conclusions.fecha BETWEEN  '2015-07-21' AND  '2015-07-31' ) GROUP BY personas.municipio, personas.parroquia, conclusions.solicitud"



def totales_municipio
@fecha_inicio = params[:fecha_inicio]
@fecha_fin = params[:fecha_fin]
@total_municipio= Persona.joins(:conclusions).group("personas.municipio, personas.parroquia, conclusions.solicitud").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-27','2015-07-31').count


#@garcia_total_uniforme = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Uniformes'").count
#@garcia_total_kitdeportivo = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Kit deportivo'").count
#@garcia_total_pasaje = Persona.joins(:conclusions).where("personas.municipio= 'Garcia' and conclusions.solicitud ='Pasaje(s)'").count


end





  def totales
  

  @beca_educacion = Conclusion.where(:solicitud=> "Beca Educacion").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @beca_universitaria = Conclusion.where(:solicitud=> "Beca Universitaria").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @econ_Discapacidad= Conclusion.where(:solicitud=> "Econ. Discapacidad").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @operacion= Conclusion.where(:solicitud=> "Operacion").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @estudio_especializado= Conclusion.where(:solicitud=> "Estudio Especializado").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @medicinas= Conclusion.where(:solicitud=> "Medicinas").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @silla_de_ruedas=Conclusion.where(:solicitud=> "Silla de Ruedas").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @andadera=Conclusion.where(:solicitud=> "Andadera").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @baston=Conclusion.where(:solicitud=> "Baston").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @botas_ortopedicas=Conclusion.where(:solicitud=> "Botas Ortopedicas").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @protesis=Conclusion.where(:solicitud=> "Protesis").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @cama=Conclusion.where(:solicitud=> "Cama").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @cama_clinica=Conclusion.where(:solicitud=> "Cama Clinica").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @colchon=Conclusion.where(:solicitud=> "Colchon").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @colchon_clinico=Conclusion.where(:solicitud=> "Colchon Clinico").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @colchon_antiescaras=Conclusion.where(:solicitud=> "Colchon Antiescaras").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @lavadora=Conclusion.where(:solicitud=> "Lavadora").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @cocina=Conclusion.where(:solicitud=> "Cocina ").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @nevera=Conclusion.where(:solicitud=> "Nevera ").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @freezer=Conclusion.where(:solicitud=> "Freezer").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @hijos_de_vzla=Conclusion.where(:solicitud=> "Hijos de Vzla  ").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @amor_mayor=Conclusion.where(:solicitud=> "Amor Mayor").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @vivienda=Conclusion.where(:solicitud=> "Vivienda").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @kit_construccion=Conclusion.where(:solicitud=> "Kit de material de construccion").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @techo=Conclusion.where(:solicitud=> "Techo").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @tanque=Conclusion.where(:solicitud=> "Tanque").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @maquina_coser=Conclusion.where(:solicitud=> "Maquina de Coser").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @uniformes=Conclusion.where(:solicitud=> "Uniformes").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @kit_deportivo=Conclusion.where(:solicitud=> "Kit deportivo").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count
  @pasajes=Conclusion.where(:solicitud=> "Pasaje(s)").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-20','2015-07-25').count

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
    @persona.families.build  if @persona.families.empty?
    @persona.conclusions.build  if @persona.conclusions.empty?

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
      params.require(:persona).permit(:nombre1, :nombre2, :apellido1, :apellido2, :cedula, :direccion, :referencia, :municipio, :parroquia, :telefono1, :telefono2,  economy_attributes: [:sector,:empresa,:ingreso_familiar,:tipo_casa,:condiciones_de_vivienda,:persona_hab,:cant_hijos,:enceres_compartidos,:adultos_mayores,:discapacitados,:enfermos,:pobreza_extrema, :descripcion],conclusions_attributes: [:id, :solicitud,:estado,:fecha,:_destroy],families_attributes: [:id, :nombre,:apellido,:parentesco,:_destroy])

    end
end
#:economy[:sector,:empresa,:ingreso_familiar,:tipo_casa,:condiciones_de,:persona_hab,:cant_hijos,:enceres_compartidos,:adultos_mayores,:discapacitados,:enfermos]
