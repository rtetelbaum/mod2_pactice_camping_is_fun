class SignupsController < ApplicationController
	def new
		@signup = Signup.new
		@campers = Camper.all
		@activities = Activity.all
	end

	def create
		@signup = Signup.create(params.require(:signup).permit(:camper_id, :activity_id, :time))
		if @signup.valid?
			redirect_to camper_path(@signup.camper.id)
		else
			flash[:errors] = @signup.errors.full_messages
			redirect_to new_signup_path
		end
	end
end
