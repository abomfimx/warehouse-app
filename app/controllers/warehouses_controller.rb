class WarehousesController < ApplicationController
  def show
    @warehouse = Warehouse.find(params[:id])
  end




  private 

  def warehouse_params

  end
end