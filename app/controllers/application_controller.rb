class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :report_coordinates

  add_flash_types :success, :info, :warning, :danger

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    render file: "/public/404" unless current_user
  end

  def report_coordinates
    @report_coordinates ||= Report.where(found: false).reduce(Array.new) do |memo, report|
      memo << [report.geocode].flatten
      memo
    end
  end
end
