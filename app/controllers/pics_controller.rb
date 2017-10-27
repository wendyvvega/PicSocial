class PicsController < ApplicationController
	before_action :find_pic, only: [:show, :edit, :update, :destroy]

	def index
		@pics = Pic.all.order("created_at DESC")
	end

	def show
	end

	#- necesita view
	def new 
		@pic = current_user.pics.build
	end

	def create
		@pic = current_user.pics.build(pic_params)

		if @pic.save
			redirect_to @pic, notice: "Yess! It was posted!"
		else
			render 'new'
		end
	end

	#-necesita view
	def edit
	end

	def update
		if @pic.update(pic_params)
			redirect_to @pic, notice: "Felicidades! Tu pic fue actualizada"
		else
			render 'edit'
		end
	end

	def destroy
		@pic.destroy
		redirect_to root_path
	end

	private

	def pic_params
		params.require(:pic).permit(:title, :description)
	end

	def find_pic
		@pic = Pic.find(params[:id])
	end
end