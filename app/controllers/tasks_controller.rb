class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    if @current_user
      @task = Task.new
      @task["description"] = params["task"]["description"]
      @task.save
      redirect_to "/tasks"
    else
      flash["notice"] = "You need to log in."
      redirect_to "/login"
    end

  end

  def destroy
    @task = Task.find_by({ "id" => params["id"] })
    @task.destroy
    redirect_to "/tasks"
  end
end
