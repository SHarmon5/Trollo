class TasksController < ApplicationController
    before_action :set_list
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    
    
    def index
      redirect_to board_list_path(@list.board_id, @list)
    end
  
    # def show
    # end
  
    def new
      @task = @list.tasks.new
    end
  
    def create
      @list.tasks.create_task(task_params, @list.id)
      redirect_to @list
    end
   
    def edit
  
    end
  
    def update
      Task.update_task(task_params, @task.id)
      redirect_to @list
    end
  
    def destroy
      Task.delete_task(@task.id)
      redirect_to @list
    end
  
  
    private
    # def set_board
    #   @board = Board.lists.find(params[:board_id, :list_id])
    # end
    def set_list
      @list = List.single_list(params[:list_id])
    end

    def set_task
      @task = Task.single_task(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:details, :complete)
    end
  end
  