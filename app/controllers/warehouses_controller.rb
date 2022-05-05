class WarehousesController < ApplicationController
  def show
    @warehouse = Warehouse.find(params[:id])
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
      return redirect_to root_path, notice: 'Galpão cadastrado com sucesso'
    end
    render :new
  end


  private 

  def warehouse_params
    params.require(:warehouse).permit(:name, :code, :city, :ddescription, :address,:cep, :area)
  end
end