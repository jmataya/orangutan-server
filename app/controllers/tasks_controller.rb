class TasksController < ApplicationController
	before_filter :signed_in_user

	respond_to :json

	def index
		#
		# The default response it to return assigned tasks.
		# If the call wants tasks based on workspace, 
		# then it should be specified as a parameter.
		#
		identifier = params[:workspace_id]
		unless identifier.nil?
			@workspace = Workspace.find(identifier)
			respond_with @workspace.tasks
		else
			@user = User.find(params[:uid])
			respond_with @user.tasks
		end
	end

	def show
		#
		# The default response it to return assigned tasks.
		# If the call wants tasks based on workspace, 
		# then it should be specified as a parameter.
		#
		identifier = params[:workspace_id]
		unless identifier.nil?
			@workspace = Workspace.find(identifier)
			respond_with @workspace.tasks.find(params[:id])
		else
			@user = User.find(params[:uid])
			respond_with @user.tasks.find(params[:id])
		end
	end

	def create
		@task = Task.new(params[:task])

		if @task.save
			#
			# The default response it to return assigned tasks.
			# If the call wants tasks based on workspace, 
			# then it should be specified as a parameter.
			#
			identifier = params[:workspace_id]
			unless identifier.nil?
				@task.workspace_task_relationships.create!(workspace_id: identifier)
				respond_with @task
			else
				@task.assigned_tasks.create!(user_id: params[:uid])
				respond_with @task
			end
		else
			respond_with @task
		end
	end

	def update
		@task = Task.find(params[:id])
		@task.update_attributes(params[:task])
		respond_with @task
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy

		@message = "Task successfully destroyed."
		respond_with @message
	end
end
