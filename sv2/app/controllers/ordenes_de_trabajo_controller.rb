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
    @ot = OrdenDeTrabajo.find(params[:id])
    @emp = params[:ot]["emp_rut"];
    @ot.emp_rut = @emp
    @ot.ot_est_cod = 1
    @ot.save
    redirect_to ordenes_de_trabajo_index_path, :notice => "Técnico asociado a la OT";
  end

  def destroy
  end

  def asignar
    @ot = OrdenDeTrabajo.find(params[:id])
    @emps = Empleado.where(cargo_cod: 5)
  end

  def terminar
  end
end
