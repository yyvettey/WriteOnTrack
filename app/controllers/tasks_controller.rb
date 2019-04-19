class TasksController < ApplicationController
  require 'json'
  before_action :login_req

  def new
    @user = User.find(session[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    tasks = task_params
    tasks[:current_value] = 0
    #Mahesh Starts
    if(tasks[:measure]=='Custom')
      if(tasks[:custom_measure]=="")
        flash[:error] = "Custom Measure must be filled as measure is Custom"
        redirect_to new_user_task_path(@user)
        #show error
      else
        tasks[:measure]=tasks[:custom_measure]
      end
    end
    tasks.delete(:custom_measure)
    #Mahesh ends
    if @user.tasks.find_by(title: tasks['title'])
      flash[:error] = "Title already exists"
      redirect_to new_user_task_path and return
    end
    @task = @user.tasks.new(tasks)
    if @task.save
      redirect_to new_progress_user_task_path(@user,@task)
    else
      flash[:error] = "Invalid fields #{@tasks.errors.full_messages}"
      redirect_to new_user_task_path(@user)
    end
  end

  def show
    @user = User.find(session[:user_id])
    @task = @user.tasks.find(params[:id])
    @percent = (@task.current_value*100)/@task.target_value
    @counts = @task.timers.all.group_by
    @times = Hash.new
    @counts.each do |t|
      if @times.has_key? t.created_at.to_date
        @times[t.created_at.inspect.to_date] += t.hours*60 + t.minutes + t.seconds.to_f/60
      else
        @times[t.created_at.inspect.to_date] = t.hours*60 + t.minutes + t.seconds.to_f/60
      end
    end
  end
  
  def progress
    @user = User.find(session[:user_id])
    @task = @user.tasks.find(params[:id])
    
    @task_timers = @task.timers
  end
  
  def new_progress
    @user = User.find(session[:user_id])
    @task = @user.tasks.find(params[:id])
    @timers = @task.timers.all
    @sec = 0
    @timers.each do |time|
      @sec += time.seconds+(60*time.minutes)+(60*60*time.hours)
    end
    @counts = @task.timers.all.group_by
  end

  def update_task
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
    @task.current_value = params[:task][:current_value].to_i + @task.current_value
    @timer = @task.timers.new
    @timer.hours = params[:task][:hour]
    @timer.minutes = params[:task][:min]
    @timer.seconds = params[:task][:sec]
    @timer.progress = params[:task][:current_value].to_i
    
    if !@timer.save or !@task.save
      flash[:error] = "Unable to update, please retry again"
    else
      flash[:success] = "Congradualtions! You have finished " + 
      (params[:task][:current_value]) + " pages. Keep it going!"
    end
    
    redirect_to user_task_path(@user,@task)
  end

  def view
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
    tasks = task_params
    task_id = @user.tasks.where('title=?',tasks['title'])
    if task_id.length!=0 and (task_id.length > 1 or task_id[0].id != @task.id)
      flash[:error] = "Title already exists"
      redirect_to edit_user_task_path(@user) and return
    end
    #Mahesh Starts
    if(tasks[:measure]=='Custom')
      if(tasks[:custom_measure]=="")
        flash[:error] = "Custom Measure must be filled as measure is Custom"
        redirect_to edit_user_task_path(@user,@task) and return
        #show error
      else
        tasks[:measure]=tasks[:custom_measure]
      end
    end
    tasks.delete(:custom_measure)
    #Mahesh ends
    if @task.update_attributes(tasks)
      redirect_to user_task_path(@user,@task)
    else
      flash[:error] = "Invalid fields #{@task.errors.full_messages}"
      redirect_to edit_user_task_path(@user,@task)
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
    @task.destroy
    flash[:success] = "Task Destroyed successfully"
    redirect_to users_path
  end
  
  def delete_progress
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
    @timer = @task.timers.find(params[:timer_id])
    @timer.destroy
    flash[:success] = "Task Destroyed successfully"
    redirect_to progress_user_task_path(@user,@task)
  end

  protected
  def task_params
    params.require(:task).permit(:title, :email, :desc, :target_date, :target_value, :measure, :create_date,:custom_measure,:hour,:min,:sec)
  end
  
  def login_req
    if session[:user_id]==nil
        redirect_to login_path
    end
  end
  

end
