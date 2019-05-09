class PartOperationsController < ApplicationController
    before_action :set_part
    before_action :set_part_part_operation, only: [:show, :update, :destroy]
  
    # GET /parts/:part_id/part_operations
    def index
      json_response(@part.part_operations)
    end
  
    # GET /parts/:part_id/part_operations/:id
    def show
      json_response(@part_operation)
    end
  
    # POST /parts/:part_id/part_operations
    def create
      @part.part_operations.create!(part_operation_params)
      json_response(@part, :created)
    end
  
    # PUT /parts/:part_id/part_operations/:id
    def update
      @part_operation.update(part_operation_params)
      head :no_content
    end
  
    # DELETE /parts/:part_id/part_operations/:id
    def destroy
      @part_operation.destroy
      head :no_content
    end
  
    private
  
    def part_operation_params
      params.permit(:name, :number)
    end
  
    def set_part
      @part = Part.find(params[:part_id])
    end
  
    def set_part_part_operation
      @part_operation = @part.part_operations.find_by!(id: params[:id]) if @part
    end
  end