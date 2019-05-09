class WorkOrderLinesController < ApplicationController
    before_action :set_workable
    before_action :set_workable_work_order_line, only: [:show, :edit, :update, :destroy]
    
  
    # GET /parts/:part_id/work_order_lines
    def index
      if @workable
        json_response(@workable.work_order_lines)
      elsif
        json_response(WorkOrderLine.all)
      end
    end
  
    # GET /parts/:part_id/work_order_lines/:id
    def show
      json_response(@work_order_line)
    end
  
    # POST /parts/:part_id/work_order_lines
    def create
      if @workable
        attributes = work_order_line_params.clone
        if @workable.class == Part
          attributes[:part_key] = @workable.id
        elsif @workable.class == WorkOrder
          attributes[:work_order_key] = @workable.id
          
        end
        @workable.work_order_lines.create!(attributes)
        json_response(@workable, :created)
      else
        @work_order_line = WorkOrderLine.create!(work_order_line_params)
        json_response(@work_order_line, :created)
      end
    end
  
    # PUT /parts/:part_id/work_order_lines/:id
    def update
      @work_order_line.update(work_order_line_params)
      head :no_content
    end
  
    # DELETE /parts/:part_id/work_order_lines/:id
    def destroy
      @work_order_line.destroy
      head :no_content
    end
  
    private
  
    def work_order_line_params
      params.permit(:complete, :complete_date, :quantity, :released, :released_date, :work_order_key, :part_key)
    end
  
    def set_workable
      
        klass = [WorkOrder, Part].detect{|c| params["#{c.name.underscore}_id"]}
        if klass
        @workable = klass.find(params["#{klass.name.underscore}_id"])
        end
    end
  
    def set_workable_work_order_line
      if @workable
        @work_order_line = @workable.work_order_lines.find_by!(id: params[:id])
      else
        @work_order_line = WorkOrderLine.find(params[:id])
      end
    end
  end