class WorkspacesController < ApplicationController
	before_filter :signed_in_user
	
	def index
		@user = User.find(params[:user_id])
		@workspaces = @user.workspaces

		respond_to do |format|
			format.json { render json: @workspaces }
		end
	end

	def show
		@user = User.find(params[:user_id])
		@workspace = @user.workspaces.find_by_id(params[:id])

		respond_to do |format|
			format.json { render json: @workspace }
		end
	end

	def new
		@workspace = Workspace.new

		respond_to do |format|
			format.json { render json: @workspace }
		end
	end

	def edit
		@user = User.find(params[:user_id])
		@workspace = @user.workspaces.find_by_id(params[:id])
	end

	def create
		@user = User.find_by_id(params[:user_id])
		@workspace = Workspace.new(params[:workspace])

		respond_to do |format|
			if @workspace.save
				@uwr = @workspace.user_workspace_relationships.build(user_id: @user.id)
				if @uwr.save
					format.json { render json: @workspace, status: :created, location: @user }
				else
					format.json { render json: @uwr.errors, status: :unprocessable_entity }
				end
			else
				format.json { render json: @workspace.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		@workspace = Workspace.find(params[:id])

		respond_to do |format|
			if @workspace.update_attributes(params[:workspace])
				format.json { head :no_content }
			else
				format.json { render json: @workspace.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@workspace = Workspace.find(params[:id])
		@workspace.destroy

		respond_to do |format|
			format.json { head :no_content }
		end
	end
end
