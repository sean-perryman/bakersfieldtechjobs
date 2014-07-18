class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :authenticate_user! # Prevent users from accessing the site without being logged in.

  def after_sign_in_path_for(resource)
	  jobs_path
	end

	def login_required
    redirect_to('/users/sign_in') if current_user.blank?
  end

  def verify_is_admin
	  (current_user.nil?) ? redirect_to(jobs_path) : (redirect_to(jobs_path) unless current_user.admin?)
	end
end
