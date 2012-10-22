class WorkspacesController < ApplicationController
	before_filter :signed_in_user

	respond_to :json
	
	def index
		@user = User.find(params[:uid])
		respond_with @user.workspaces
	end

	def show
		@user = User.find(params[:uid])
		respond_with @user.workspaces.find_by_id(params[:id])
	end

	def create
		@user = User.find_by_id(params[:uid])
		@workspace = Workspace.new(params[:workspace])

		if @workspace.save
			@uwr = @workspace.user_workspace_relationships.build(user_id: @user.id)
			if @uwr.save
				respond_with @workspace
			else
				respond_with @uwr
			end
		else
			respond_with @workspace
		end
	end

	def update
		@workspace = Workspace.find(params[:id])
		@workspace.update_attributes(params[:workspace])
		respond_with @workspace
	end

	def destroy
		@workspace = Workspace.find(params[:id])
		@workspace.destroy

		@message = "Workplace successfully destroyed."
		respond_with @message
	end
end
