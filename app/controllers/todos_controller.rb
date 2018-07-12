class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :null_session

  # POST projects/1/todos
  # POST projects/1/todos
  def create
    temp_proj = Project.find(params[:id])
    render json: temp_proj.todos.create!(todo_params)
  end

  # PATCH/PUT projects/1/todos/1
  # PATCH/PUT projects/1/todos/1
  def update
    Todo.update(params[:idTodo],:isCompleted => params[:todo][:isCompleted])
  end
  
   private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:text, :isCompleted, :project_id)
    end
end
