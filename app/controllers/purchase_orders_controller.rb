class PurchaseOrdersController < ApplicationController
    before_action :logged_in?, only: [:index, :show, :edit, :destroy]
    before_action :set_po, only: [:show, :edit, :update, :destroy]
    def index 
        @purchase_orders = PurchaseOrder.all
    end

    def new 
        @purchase_order = PurchaseOrder.new
    end
    
    def create
        @purchase_order = PurchaseOrder.new(po_params)
        if @purchase_order.save && !po_params.empty?
            redirect_to purchase_orders_path
        else 
            render :new
        end
    end

    def show
        
    end

    def edit 

    end

    def update
        @purchase_order.update()
    end

    private 
    def po_params
        params.require(:purchase_order).permit(:po, :bin, :start_date, :completion_date)
    end

    def set_po
        @purchase_order = PurchaseOrder.find_by(id: params[:id])
    end
end
