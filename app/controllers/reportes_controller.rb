class ReportesController < ApplicationController
  def index
    @municipio = Locality.all
    @insti=Institution.all.order("orden ASC")
  end

end
