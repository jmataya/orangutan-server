module ApplicationHelper

  def signed_in_user
    auth_id = params[:auth]
    user_id = params[:uid]
    if auth_id.nil? or auth_id != "00000000-0000-0000-0000-000000000000" or user_id.nil?
      redirect_to root_path
    end
  end
  
end
