class CampersController < ApplicationController
  def index
    @campers = Camper.all
	end
	
	def show
		@camper = Camper.find(params[:id])
	end

	def new
		@camper = Camper.new
	end

	def create
		@camper = Camper.create(params.require(:camper).permit(:name, :age))
		if @camper.valid?
			redirect_to camper_path(@camper)
		else
			flash[:errors] = @camper.errors.full_messages
			redirect_to new_camper_path
		end
	end

end
