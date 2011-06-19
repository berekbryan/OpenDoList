class TasksController < ApplicationController

  # GET /tasks
  # GET /tasks.xml
  def index
    user = current_user
    @tasks = user.tasks.find(:all, :conditions => { :isCompleted => "false"})

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end
  end


  # GET /tasks/new
  # GET /tasks/new.xml
  def new
    user = current_user
    @task = user.tasks.push(Task.new)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task }
    end
  end


  # GET /tasks/1/edit
  def edit
    user = current_user
    @task = user.tasks.find(params[:id])
  end


  # POST /tasks
  # POST /tasks.xml
  def create
    user = current_user
    @task = user.tasks.new(params[:task])
    @task.isCompleted = false
    
    respond_to do |format|
      if @task.save
        format.html { redirect_to(tasks_path, :notice => 'Task was successfully created.') }
        format.xml  { render :xml => tasks_path, :status => :created, :location => @task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end


  # PUT /tasks/1
  # PUT /tasks/1.xml
  def update
    user = current_user
    @task = user.tasks.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to(@task, :notice => 'Task was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /tasks/1
  # DELETE /tasks/1.xml
  def destroy
    user = current_user
    @task = user.tasks.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { head :ok }
    end
  end
  
  # list of completed tasks
  def completed
    user = current_user
    @tasks = user.tasks.find(:all, :conditions => { :isCompleted => "true"})

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end    
  end
  
  
  #
  # Methods
  #
  
  # complete task
  def complete
     user = current_user
     @task = user.tasks.find(params[:id])
     new = {:isCompleted => true}
     @task.update_attributes(new)
     redirect_to :controller => "tasks"
  end


  # uncomplete task
  def uncomplete
     user = current_user
     @task = user.tasks.find(params[:id])
     new = {:isCompleted => false}
     @task.update_attributes(new)
     redirect_to :controller => "items"
  end  

end

