# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  before_filter :authorize, :except => :login
  helper :all # include all helpers, all the time
#protect_from_forgery :secret => '8fc080370e56e929a2d5afca5540a0f7'
#  protect_from_forgery
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  protected
  def authorize
    unless User.find_by_id(:session[:user_id])
      flash[:notice] = "Please log in"
      redirect_to :controller => 'session', :action => 'new'
    end
  end
end
