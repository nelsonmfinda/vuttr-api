class Api::V1::ToolsController < ApplicationController
  before_action :set_tool, only: [:destroy, :update]

  # GET /tools
  # GET /tools?tag=
  def index
    if params.has_key?(:tag)
      if !tool_search.empty?
        @tools = tool_search.paginate(page: params[:page], per_page: 10)
        json_response(@tools)
      else
        json_response([], :not_found)
      end
    else
      @tools = current_user.tools.paginate(page: params[:page], per_page: 10)
      json_response(@tools)
    end
  end

  # POST /tools
  def create
    @tool = current_user.tools.create!(tool_params)
    json_response(@tool, :created)
  end

  # GET /tools/:id
  def show
    json_response(set_tool)
  end

  # PATCH/PUT /tools/:id
  def update
    head :no_content
  end

  # DELETE /tools/:id
  def destroy
    @tool.destroy
    head :no_content
  end

  private
    def tool_params
      params.permit(:title, :description, :link, :created_by, tags: [])
    end

    def tool_search
      current_user.tools.where("? = ANY (tags)", params[:tag])
    end

    def set_tool
      @tool = current_user.tools.find(params[:id])
    end
end
