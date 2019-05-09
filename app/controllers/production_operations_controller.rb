class ProductionOperationsController < ApplicationController
    before_action :set_produceable
    before_action :set_produceable_production_operation, only: [:show, :edit, :update, :destroy]
  
    # GET /parts/:part_id/production_operations
    def index
      json_response(@produceable.production_operations)
    end
  
    # GET /parts/:part_id/production_operations/:id
    def show
      json_response(@production_operation)
    end
  
    # POST /parts/:part_id/production_operations
    def create
      @produceable.production_operations.create!(production_operation_params)
      json_response(@produceable, :created)
    end
  
    # PUT /parts/:part_id/production_operations/:id
    def update
      @production_operation.update(production_operation_params)
      head :no_content
    end
  
    # DELETE /parts/:part_id/production_operations/:id
    def destroy
      @production_operation.destroy
      head :no_content
    end
  
    private
  
    def production_operation_params
      params.permit(:complete, :completed_date)
    end
  
    def set_produceable
        klass = [WorkOrderLine, PartOperation].detect{|c| params["#{c.name.underscore}_id"]}
        @produceable= klass.find(params["#{klass.name.underscore}_id"])
    end
  
    def set_produceable_production_operation
      @production_operation = @produceable.production_operations.find_by!(id: params[:id]) if @produceable
    end
  end