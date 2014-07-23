class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead
  before_action :set_modal


  def set_modal
    @tutorial = Tutorial.new
    @this_tutorial = Tutorial.find(params[:id]) if params[:id]
    @user = User.new
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  protect_from_forgery with: :exception

end
