class PartsController < ApplicationController
    before_action :set_part, only: [:show, :update, :destroy]
  
    # GET /parts
    def index
      @parts = Part.all
      json_response(@parts)
    end
  
    # POST /parts
    def create
      @part = Part.create!(part_params)
      json_response(@part, :created)
    end
  
    # GET /parts/:id
    def show
      json_response(@part)
    end
  
    # PUT /parts/:id
    def update
      @part.update(part_params)
      head :no_content
    end
  
    # DELETE /parts/:id
    def destroy
      @part.destroy
      head :no_content
    end
  
    private
  
    def part_params
      # whitelist params
      params.permit(:name, :number)
    end
  
    def set_part
      @part = Part.find(params[:id])
    end
  end