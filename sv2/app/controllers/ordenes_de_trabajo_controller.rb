class OrdenesDeTrabajoController < ApplicationController
  def index
    if current_empleado.cargo_empleado.cargo_nom.downcase == "administrador"
      @ots = OrdenDeTrabajo.all
    else
      redirect_to '/errors/not_found'
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  def designar
  end

  def terminar
  end
end
