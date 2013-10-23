# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

require_dependency 'password'

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '9b345d9b6d25ed1a1078e5a46d5330e7'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password

  ActiveScaffold.set_defaults do |config|
    config.security.current_user_method = :current_login
  end

  private
  
  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      result = false
      u = User.find_by_userName(user_name)
      if u && u.passwordHash == password
        result = true
        session[:user] = u.userName
        session[:group] = u.byline.GroupID
      end
      result
    end
  end

  def current_login
    session[:user] ? User.find_by_userName(session[:user]) : nil
  end

  # Permissions
  def webmaster?
    session[:group] == 1
  end

  def faculty_advisor?
    session[:group] <= 2
  end

  def student_editor?
    session[:group] <= 3
  end

  def photographer?
    session[:group] <=4
  end

  def antelope_staff?
    session[:group] <= 5
  end

  def guest_writer?
    session[:group] <= 6
  end

  def college_football_columnist?
    session[:group] <= 7
  end
end
