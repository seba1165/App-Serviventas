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

    if @emp == ""
      redirect_to ordenes_de_trabajo_index_path, :notice => "Ingrese un tecnico correctamente";
    else
      @ot.ot_est_cod = 1
      if @ot.save
        redirect_to ordenes_de_trabajo_index_path, :notice => "Técnico asociado a la OT";
      else
        redirect_to ordenes_de_trabajo_index_path, :notice => "El tecnico no pudo ser asociado a la OT";
      end
    end
  end

  def destroy
  end

  def asignar
    @ot = OrdenDeTrabajo.find(params[:id])
    @emps = Empleado.where(cargo_cod: 5)
  end

  def terminar
    @ot = OrdenDeTrabajo.find(params[:id])
    @cot = ServInst.where(doc_cod: @ot.doc_cod).first
    @ot.ot_est_cod = 2
    if (@ot.save)
      @not_ven = NotaDeVenta.where(doc_cod: @ot.doc_cod).first
      @ot.not_ven_cod = @not_ven.not_ven_cod
      @cot.not_ven_cod = @not_ven.not_ven_cod
      @ot.save
      @cot.save
      @not_ven.doc_cod = @cot.doc_cod
      @not_ven.save
      redirect_to ordenes_de_trabajo_index_path, :notice => "OT terminada con exito";
    else
      redirect_to ordenes_de_trabajo_index_path, :notice => "La OT no pudo ser terminada con exito";
    end
  end
end
