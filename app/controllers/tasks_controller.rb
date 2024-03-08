class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_task, only: [:show, :edit, :update, :destroy]
  
    def index
      @tasks = Task.all
    end
  
    def show
    end
  
    def new
      @task = Task.new
    end
  
    def create
      @task = Task.new(task_params)
  
      if @task.save
        redirect_to @task, notice: 'Task was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @task.update(task_params)
        redirect_to @task, notice: 'Task was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @task.soft_delete  # Assuming you have soft deletion implemented
      redirect_to tasks_url, notice: 'Task was successfully deleted.'
    end
  
    private
  
    def set_task
      @task = Task.find(params[:id])
    end
  
    # Task Params
    def task_params
      params.require(:task).permit(:category_id, :user_id, :task_name, :task_details, :priority, :due_date, :completion_status)
    end
  end
  