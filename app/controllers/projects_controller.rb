class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :null_session

  # GET /projects
  # GET /projects.json
  def index
    render json: Project.all.to_json(:include => :todos)
  end
  
 private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title)
    end
end
