class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :new_task, :create_task,:edit_task, :update_task,:destroy_task, :create_comment]
  before_action :set_task, only: [:edit_task, :update_task,:destroy_task, :create_comment]

  # GET /projects
  # GET /projects.json
  def index
    @projects = current_user.projects.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
   # binding.pry
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.new(project_params)
    respond_to do |format|
      if @project.save
    	@projects = current_user.projects
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @project }
      else 

        format.js
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
      	@projects = current_user.projects
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.js
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.js
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.js
      format.json { head :no_content }
    end
  end

  # Tasks Management
  def new_task
    @task  = @project.tasks.new()
  end

  def create_task
    @task = @project.tasks.new(task_params)
    respond_to do |format|
      if @task.save
        @tasks = @project.tasks
        format.js
      else
        format.js
      end
    end
  end

  def edit_task
  end

  def update_task
     respond_to do |format|
      if @task.update(task_params)
        @tasks = @project.tasks
        format.js
      else
        format.js
      end
    end
  end

  def destroy_task
     @task.destroy
    respond_to do |format|
      format.js
    end
  end
  def destroy_comment
    @comment = Comment.find(params[:id])
     @comment.destroy
      @task = @comment.task
      @project= @task.project
    respond_to do |format|
   
      format.js
    end
  end

  def create_comment
    @comment = @task.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        @comments = @task.comments
        format.js
      else
        format.js
      end
    end
  end
  def change_task_status
    Task.find(params[:task_id]).update(is_done:params[:value])
     respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = current_user.projects.find_by(id: params[:id])
    end    

    def set_task
      @task = @project.tasks.find_by(id: params[:tid])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :description,:creator_id)
    end    

    def task_params
      params.require(:task).permit(:title, :project_id,:due_on)
    end    

    def comment_params
    	params.require(:comment).permit(:content)
    end
end