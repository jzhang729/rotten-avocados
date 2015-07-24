module ApplicationHelper

  def admin_user
    @admin_user ||=User.find(session[:admin_id]) if session[:admin_id]
  end
    
end