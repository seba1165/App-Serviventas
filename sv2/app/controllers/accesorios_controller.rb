class AccesoriosController < ApplicationController
  def index
    if current_empleado.cargo_empleado.cargo_nom.downcase != "administrador"
      redirect_to '/errors/not_found'
    else
      @accesorios = Accesorio.all();
    end
  end

  def new
    if current_empleado.cargo_empleado.cargo_nom.downcase != "administrador"
      redirect_to '/errors/not_found'
    else
      @accesorio = Accesorio.new
      @tipos = TipoArticulo.all
    end

  end

  def create
    if current_empleado.cargo_empleado.cargo_nom.downcase != "administrador"
      redirect_to '/errors/not_found'
    else
      #Recuperamos las variables POST que vinieron desde la acción new.
      @art_cod = params[:accesorio][:art_cod];
      @art_tipo_cod = params[:accesorio][:art_tipo_cod];
      @art_nom = params[:accesorio][:art_nom];
      @art_stock = params[:accesorio][:art_stock];
      @art_precio = params[:accesorio][:art_precio];
      @art_imagen = params[:accesorio][:art_imagen];

      @accesorio = Accesorio.new({
                                   :art_cod => @art_cod,
                                   :art_tipo_cod => @art_tipo_cod,
                                   :art_nom => @art_nom,
                                   :art_stock => @art_stock,
                                   :art_precio => @art_precio,
                                   :art_imagen => @art_imagen,
                               });


      #Verificamos si la tarea ha podido ser guardado correctamente.
      if @accesorio.save()
        redirect_to articulos_path, :notice => "El accesorio ha sido guardado con éxito";
      else
        redirect_to articulos_path, :notice => "El accesorio no se pudo guardar";
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end