class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @tasks = Task.new
  end

  def create
    @tasks = Task.new(params.require(:task).permit(:title, :start, :end, :allday, :memo))
      if @tasks.save
        flash[:notice] = "スケジュールを新規登録しました"
        redirect_to tasks_index_path
      else
        render "new"
      end
  end

  def show
    @task = Task.find params[:id]
    @task = Task.find_by(id: params[:id])
    @tasks_count = Task.count
  end

  def edit
    @tasks = Task.find params[:id]
  end

  def update
    @tasks = Task.find params[:id]
    if @tasks.update(params.require(:task).permit(:title, :start, :end, :allday, :memo))
       flash[:notice] = "スケジュールID「#{@tasks.id}」の情報を更新しました"
       redirect_to tasks_index_path
    else
        render "edit"
    end
  end

  def destroy
    @task = Task.find params[:id]
    @task.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to tasks_index_path
  end
end
