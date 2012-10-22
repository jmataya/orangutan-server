module TasksHelper
	def get_identifier
		@identifier = params[:workspace_id]
		unless @identifier.nil?
			@identifier = params[:uid]
		end
	end
end
