class PersonasController < ApplicationController
  before_action :set_persona, only: [:show, :edit, :update, :destroy]
  layout "limpio", only: [:reporte_ayuda,:reporte_municipio,:reporte_municipio_listado,:reporte_totales_sectores,:reporte_por_institucion,  :reporte_listado_rango]

 def reporte_totales_sectores
   #hay que revisar esto bien
   @id_localidad= Locality.find_by_sql("select localities.fecha, localities.id, localities.municipio, localities.sector from localities where (fecha between '#{params[:fecha1]}' and '#{params[:fecha2]}') and localities.activo=true order by localities.fecha")
   @ayudas =Ayuda.joins(:institution).order("institutions.orden,ayudas.nombre")
   @texto="Reporte General de las Localidades desde  #{params[:fecha1]} hasta #{params[:fecha2]}"
  end


def reporte_por_institucion
    if params[:fecha]=="todos"
      @texto = "Reporte general por Institucion"
      a="select personas.id, institutions.nombre as institution, cedula,concat(nombre1,' ',apellido1) as nombres ,telefono1, direccion,conclusions.estado,localities.municipio,localities.sector,ayudas.nombre as ayuditas from personas,localities,conclusions,ayudas,institutions where personas.id=conclusions.persona_id and localities.id=conclusions.locality_id and conclusions.ayuda_id=ayudas.id and ayudas.institution_id=institutions.id and institutions.id=#{params[:id]} order by cedula "
    else
      @localidad = Locality.where(:id=> params[:fecha])
      @texto = "Reporte por Institucion en #{@localidad.last.municipio} #{@localidad.last.sector} #{@localidad.last.fecha.strftime('%d/%m/%Y')}"
      a="select personas.id, institutions.nombre as institution, cedula,concat(nombre1,' ',apellido1) as nombres ,telefono1, direccion,conclusions.estado,localities.municipio,localities.sector,ayudas.nombre as ayuditas from personas,localities,conclusions,ayudas,institutions where localities.id=#{params[:fecha]} and personas.id=conclusions.persona_id and localities.id=conclusions.locality_id and conclusions.ayuda_id=ayudas.id and ayudas.institution_id=institutions.id and  institutions.id=#{params[:id]} order by cedula "
    end

    @normal = Persona.find_by_sql("select ayudas.id,count(*) as cuenta ,localities.municipio,localities.sector ,localities.fecha, conclusions.estado, ayudas.nombre, institutions.nombre  as institucion_nombre from personas,ayudas, localities ,conclusions ,institutions where personas.id=conclusions.persona_id and conclusions.locality_id = localities.id and ayudas.id = conclusions.ayuda_id and locality_id=#{params[:fecha]} and ayudas.institution_id = institutions.id and conclusions.estado = 'Normal' group by (conclusions.ayuda_id)")
    @urgente = Persona.find_by_sql("select ayudas.id,count(*) as cuenta , localities.municipio,localities.sector ,localities.fecha,conclusions.estado, ayudas.nombre, institutions.nombre  as institucion_nombre from personas,ayudas, localities ,conclusions ,institutions where personas.id=conclusions.persona_id and conclusions.locality_id = localities.id and ayudas.id = conclusions.ayuda_id and locality_id=#{params[:fecha]} and ayudas.institution_id = institutions.id and conclusions.estado = 'Urgente' group by (conclusions.ayuda_id)")
    @resultado= Persona.find_by_sql("select ayudas.id,count(*) as cuenta, localities.municipio,localities.sector ,localities.fecha,ayudas.nombre, institutions.nombre  as institucion_nombre from personas,ayudas, localities ,conclusions ,institutions  where personas.id=conclusions.persona_id and conclusions.locality_id = localities.id and ayudas.id = conclusions.ayuda_id and locality_id=#{params[:fecha]} 	  and ayudas.institution_id = institutions.id and (conclusions.estado = 'Normal' or conclusions.estado = 'Urgente' ) and institutions.id=#{params[:id]} group by (conclusions.ayuda_id) order by institutions.orden ASC")

    @institucion  = Persona.find_by_sql(a)
    @listado_ayudas = Persona.find_by_sql("select conclusions.persona_id, ayudas.nombre, conclusions.estado  from personas,ayudas, localities ,conclusions where personas.id=conclusions.persona_id and conclusions.locality_id = localities.id and ayudas.id = conclusions.ayuda_id and ayudas.institution_id=#{params[:id]} and (conclusions.estado = 'Urgente' or conclusions.estado='Normal') order by (conclusions.ayuda_id)")
end

def reporte_listado_rango
  mun=["Antolín del Campo","Arismendi","Díaz","García","Gómez","Maneiro","Marcano", "Mariño", "Península de Macanao", "Tubores", "Villalba"]

    if params[:id]=="todos" #id de la institucion
      @texto = "Reporte General"
      i=''
      @ins=false
    else
      @ins=true
      @texto = "Reporte por Institucion "
      i="institutions.id='#{params[:id]}' and"
    end

    if params[:muni]=="todos" #municipio
      @ban=true
    else
      @ban=false
      n=params[:muni]
      m=mun[n.to_i]
      @texto = @texto+" del Municipio:  #{m}"
      a="localities.municipio='#{m}' and"
    end

    if params[:sector]=="todos" #sector
      s=''
      @ban2=true
    else
      @ban2=false
      sector = Locality.where(:id=> params[:sector])
      if !sector.blank?
        sec=sector.last.sector
        @texto = @texto+", Sector:  #{sec}"
      else
        @texto = @texto+", NO EXISTE EL SECTOR"
      end
      s="localities.sector='#{sec}' and"
    end
    if params[:ayuda]=="todos" #ayuda
      ay=''
    else
      ayu = Ayuda.where(:id=> params[:ayuda])
      if !ayu.blank?
        @texto = @texto+", Tipo de Ayuda: #{ayu.last.nombre} "
      else
        @texto = @texto+", ERROR NO EXISTE LA AYUDA"
      end
      ay="conclusions.ayuda_id='#{params[:ayuda]}' and"
    end
    if ((params[:f1]=='0' or params[:f2]=='0') or (params[:f1]=='0' and params[:f2]=='0')) #rango de fechas
      b=''
      @ban1=true
    else
      if params[:f1]==params[:f2] #rango de fechas
        @ban1=false
      else
        @ban1=true
      end
      @texto = @texto+", desde el  #{params[:f1]} hasta #{params[:f2]} "
      b="(localities.fecha between '#{params[:f1]}' and '#{params[:f2]}') and"
    end

    #and (conclusions.estado = 'Urgente' or conclusions.estado='Normal')

  @institucion  = Persona.find_by_sql("select distinct personas.id,localities.fecha,  institutions.nombre as institution, cedula,concat(nombre1,' ',apellido1) as nombres ,telefono1, direccion,conclusions.estado,localities.municipio,localities.sector,ayudas.nombre as ayuditas from personas,localities,conclusions,ayudas,institutions where #{a} #{b} #{i} #{s} #{ay} personas.id=conclusions.persona_id and localities.id=conclusions.locality_id and conclusions.ayuda_id=ayudas.id and ayudas.institution_id=institutions.id  group by cedula order by localities.fecha,cedula ASC ")
  @listado_ayudas = Persona.find_by_sql("select personas.id, institutions.nombre as institution, cedula,concat(nombre1,' ',apellido1) as nombres ,telefono1, direccion,conclusions.estado,localities.municipio,localities.sector,ayudas.nombre as ayuditas from personas,localities,conclusions,ayudas,institutions where #{a} #{b} #{i} #{s} #{ay} personas.id=conclusions.persona_id and localities.id=conclusions.locality_id and conclusions.ayuda_id=ayudas.id and ayudas.institution_id=institutions.id order by localities.fecha,cedula ASC ")

end

def reporte_ayuda

  @texto=""
  if ((params[:fecha1]=='0' or params[:fecha2]=='0') or (params[:fecha1]=='0' and params[:fecha2]=='0')) #rango de fechas
    rango=''
  else
    if params[:fecha1]==params[:fecha2] #rango de fechas
      @texto = @texto+", de la fecha: #{params[:fecha1]}  "
    else
      @texto = @texto+", desde el  #{params[:fecha1]} hasta #{params[:fecha2]} "
    end
    rango="(localities.fecha between '#{params[:fecha1]}' and '#{params[:fecha2]}') and  "
  end

  @localidad= Locality.find_by_sql("select localities.fecha, localities.id, localities.municipio, localities.sector from localities where #{rango} localities.activo=true order by localities.fecha")
end

def reporte_municipio_listado

  @listado = Persona.find_by_sql("select distinct personas.id, cedula, concat(nombre1,' ',nombre2,' ',apellido1,' ',apellido2)as nombres,concat (direccion) as direccion, telefono1,ayudas.nombre, conclusions.estado,localities.fecha,localities.municipio,localities.sector  from personas,ayudas, localities ,conclusions ,institutions where personas.id=conclusions.persona_id and conclusions.locality_id = localities.id and ayudas.id = conclusions.ayuda_id and locality_id=#{params[:id]} and ayudas.institution_id = institutions.id and (conclusions.estado = 'Urgente' or conclusions.estado='Normal') group by (personas.cedula)")
  @listado_ayudas = Persona.find_by_sql("select conclusions.persona_id, ayudas.nombre, conclusions.estado  from personas,ayudas, localities ,conclusions where personas.id=conclusions.persona_id and conclusions.locality_id = localities.id and ayudas.id = conclusions.ayuda_id and locality_id=#{params[:id]} and (conclusions.estado = 'Urgente' or conclusions.estado='Normal') order by (conclusions.ayuda_id)")

end


def reporte_municipio
  mun=["Antolín del Campo","Arismendi","Díaz","García","Gómez","Maneiro","Marcano", "Mariño", "Península de Macanao", "Tubores", "Villalba"]

      @texto=""
      if params[:id]=="todos" #id de la localidad
        loca=''
      else
        localidad = Locality.where(:id=> params[:id])
        if !localidad.blank?
          @texto = @texto+" Municipio:  #{localidad.last.municipio} - Sector: #{localidad.last.sector} - Fecha: #{localidad.last.fecha}"
        else
          @texto = @texto+", ERROR NO EXISTE LA LOCALIDAD"
        end
        loca="conclusions.locality_id='#{params[:id]}' and"
      end

      if params[:inst]=="todos" #id de la institucion
        ins=''
      else
        institucion = Institution.where(:id=> params[:inst])
        if !institucion.blank?
          @texto=@texto+" - Institución: #{institucion.last.nombre}"
        else
          @texto = @texto+", ERROR NO EXISTE LA INSTITUCION"
        end
        ins="institutions.id='#{params[:inst]}' and"
      end

      if params[:muni]=="todos" #municipio
        municipio=''
      else
        n=params[:muni]
        @m=mun[n.to_i]
        @texto = @texto+" - Municipio:  #{@m}"
        municipio="localities.municipio='#{@m}' and"
      end

      if ((params[:f1]=='0' or params[:f2]=='0') or (params[:f1]=='0' and params[:f2]=='0')) #rango de fechas
        rango=''
      else
        if params[:f1]==params[:f2] #rango de fechas
          @texto = @texto+", Fecha:  #{params[:f1]} "
        else
          @texto = @texto+", desde el  #{params[:f1]} hasta #{params[:f2]} "
        end
        rango="(localities.fecha between '#{params[:f1]}' and '#{params[:f2]}') and"
      end
   @i=0
   @adentro = true
   @resultado = Persona.find_by_sql("select ayudas.id,count(*) as cuenta, localities.municipio,localities.sector ,localities.fecha,ayudas.nombre, institutions.nombre  as institucion_nombre from personas,ayudas, localities ,conclusions ,institutions where #{ins} #{rango} #{loca} #{municipio} personas.id=conclusions.persona_id and conclusions.locality_id = localities.id and ayudas.id = conclusions.ayuda_id and  ayudas.institution_id = institutions.id  group by (conclusions.ayuda_id) order by institutions.orden ASC,ayudas.nombre")
   #@p="select ayudas.id,count(*) as cuenta, localities.municipio,localities.sector ,localities.fecha,ayudas.nombre, institutions.nombre  as institucion_nombre from personas,ayudas, localities ,conclusions ,institutions where #{ins} #{rango} #{loca} #{municipio} personas.id=conclusions.persona_id and conclusions.locality_id = localities.id and ayudas.id = conclusions.ayuda_id and  ayudas.institution_id = institutions.id and (conclusions.estado = 'Normal' or conclusions.estado = 'Urgente' ) group by (conclusions.ayuda_id) order by institutions.orden ASC,ayudas.nombre"
   #




   @normal = Persona.find_by_sql("select ayudas.id,count(*) as cuenta , localities.municipio,localities.sector ,localities.fecha,conclusions.estado, ayudas.nombre, institutions.nombre  as institucion_nombre from personas,ayudas, localities ,conclusions ,institutions where #{ins}  #{rango}  #{loca} #{municipio} personas.id=conclusions.persona_id and conclusions.locality_id = localities.id and ayudas.id = conclusions.ayuda_id  and ayudas.institution_id = institutions.id and conclusions.estado = 'Normal' group by (conclusions.ayuda_id)")
   @urgente = Persona.find_by_sql("select ayudas.id,count(*) as cuenta , localities.municipio,localities.sector ,localities.fecha,conclusions.estado, ayudas.nombre, institutions.nombre  as institucion_nombre from personas,ayudas, localities ,conclusions ,institutions where #{ins}  #{rango}  #{loca} #{municipio} personas.id=conclusions.persona_id and conclusions.locality_id = localities.id and ayudas.id = conclusions.ayuda_id  and ayudas.institution_id = institutions.id and conclusions.estado = 'Urgente' group by (conclusions.ayuda_id)")
   @nop = Persona.find_by_sql("select ayudas.id,count(*) as cuenta , localities.municipio,localities.sector ,localities.fecha,conclusions.estado, ayudas.nombre, institutions.nombre  as institucion_nombre from personas,ayudas, localities ,conclusions ,institutions where #{ins}  #{rango}  #{loca} #{municipio} personas.id=conclusions.persona_id and conclusions.locality_id = localities.id and ayudas.id = conclusions.ayuda_id  and ayudas.institution_id = institutions.id and conclusions.estado = 'No Procede' group by (conclusions.ayuda_id)")

   #respond_to do |format|
    # format.csv { send_data @resultado.to_csv}
   #end
end

 # def reporte_diario
 # 	@resultado = Persona.joins(:conclusions).group("personas.municipio, conclusions.ayuda_id").where("conclusions.fecha='#{params[:fecha]}' and personas.municipio= #{@municipio}").count
 #
 # end

  def totales_municipio
    @fecha_inicio = params[:fecha_inicio]
    @fecha_fin = params[:fecha_fin]
    @total_municipio= Persona.joins(:conclusions).group("personas.municipio, personas.parroquia, conclusions.ayuda_id").where("conclusions.fecha BETWEEN ? AND ? ", '2015-07-27','2015-07-31').count
  end

  def index
    @personas = Persona.all.page(params[:page]).per(30)
      if params[:search]
        @personas = Persona.search(params[:search]).order("created_at DESC").page(params[:page]).per(30)
      else
        @personas = Persona.all.order('created_at DESC').page(params[:page]).per(30)
      end
  end

  # GET /personas/1
  # GET /personas/1.json
  def show
  end

  # GET /personas/new
  def new
  	@localidades = Locality.all.pluck(:municipio,:sector,:fecha)


    @persona = Persona.new
    @persona.build_economy
    @persona.families.build  if @persona.families.empty?
    @persona.conclusions.build  if @persona.conclusions.empty?

  end

  def edit
   # @persona.conclusions.build
  end

  def create
    #@fecha= Locality.find(params[locality_id]).pluck(:fecha)

    @persona = Persona.new(persona_params)

    respond_to do |format|
      if @persona.save
        format.html { redirect_to @persona, notice: 'La Persona se ha almacenado exitosamente.' }
        format.json { render :show, status: :created, location: @persona }
      else
        format.html { render :new }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @persona.update(persona_params)
        format.html { redirect_to @persona, notice: 'La Persona se ha actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @persona }
      else
        format.html { render :edit }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @persona.destroy
    respond_to do |format|
      format.html { redirect_to personas_url, notice: 'La Persona se ha eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    def set_persona
      @persona = Persona.find(params[:id])
    end

    def persona_params
      params.require(:persona).permit(:nombre1, :nombre2, :apellido1, :apellido2, :cedula, :fecha_nac,:direccion, :referencia, :municipio, :parroquia, :telefono1, :telefono2, :locality_id ,:sexo, :madre_soltera, :municipio_id,  economy_attributes: [:sector,:empresa,:ingreso_familiar,:tipo_casa,:condiciones_de_vivienda,:persona_hab,:cant_hijos,:enceres_compartidos,:adultos_mayores,:discapacitados,:enfermos,:pobreza_extrema, :descripcion],conclusions_attributes: [:id, :ayuda_id,:estado,:fecha,:_destroy,:locality_id],families_attributes: [:id, :nombre,:apellido,:fecha_nac,:parentesco,:cedula, :_destroy])

    end
end
#:economy[:sector,:empresa,:ingreso_familiar,:tipo_casa,:condiciones_de,:persona_hab,:cant_hijos,:enceres_compartidos,:adultos_mayores,:discapacitados,:enfermos]
