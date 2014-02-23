class RegistrationsController < Devise::RegistrationsController


	protected


	def after_sign_up_path_for(resource)
		'/meets'
	end

	def after_sign_in_path(resource)
	'/meets'
	end

end