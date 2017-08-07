class ApplicationController < ActionController::Base
	#防止CSRF攻击	
  protect_from_forgery with: :exception
end
