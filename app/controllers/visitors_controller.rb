class VisitorsController < ApplicationController

	def index 
		if user_signed_in?
			redirect_to '/blogs/list'
		end
	end
end
