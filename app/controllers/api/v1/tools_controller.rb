class Api::V1::ToolsController < ApplicationController

  # GET /tools
  # GET /tools?tag=
  def index
    if(params.has_key?(:tag))
      @tools = Tool.where("? = ANY (tags)", params[:tag])
      json_response(@tools)
    else
      @tools = Tool.all
      json_response(@tools)
    end
  end

  # POST /tools
  def create
    @tool = Tool.create!(tool_params)
    json_response(@tool, :created)
  end

  # GET /tools/:id
  def show
    json_response(set_tool)
  end

  # PATCH/PUT /tools/:id
  def update
    set_tool
    head :no_content
  end

  # DELETE /tools/:id
  def destroy
    set_tool.destroy
    head :no_content
  end

  private

  def tool_params
    params.permit(:title, :description, :link, :tags => [])
  end

  def set_tool
    @tool = Tool.find(params[:id])
  end
end
