class OrdenesDeDespachoController < ApplicationController
  def index
    @ods = OrdenDeDespacho.all
  end

  def update
    @od = OrdenDeDespacho.find(params[:id])
    @desp_fecha = params[:od]["desp_fecha"]
    @od_dir = params[:orden_de_despacho]["od_dir"]

    @od.desp_fecha = @desp_fecha
    @od.od_dir = @od_dir
    @od.od_est_cod = 1
    if(@od.save)
      redirect_to ordenes_de_despacho_index_path, :notice => "La orden de despacho ha sido programada";
    else
      redirect_to ordenes_de_despacho_index_path, :notice => "La orden de despacho no pudo ser programada";
    end

  end

  def programar
    @od = OrdenDeDespacho.find(params[:id])
  end

  def despachar
    @od = OrdenDeDespacho.find(params[:id])
    @od.od_est_cod = 2
    @od.save
    redirect_to ordenes_de_despacho_index_path, :notice => "Se despacho correctamente la orden";
  end
end
