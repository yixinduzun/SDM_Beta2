class InstrumentsController < ApplicationController
	before_filter :check_logged_in, :only =>[:edit,:update,:delete]
	before_filter :check_logged_in, :only =>[:subscribe]
	def new
		@instrument=Instrument.new
	end
	def create
		@instrument=Instrument.new(params[:instrument])
		@instrument.save
		redirect_to"/instruments/#{@instrument.id}"
	end
	
	def show
		@instrument=Instrument.find(params[:id])
	end
	def index
		@instruments=Instrument.find(:all)
	end
	def edit
		@instrument=Instrument.find(params[:id])
	end
	def update
		@instrument=Instrument.find(params[:id])
		@instrument.update_attributes(params[:instrument])
		redirect_to"/instruments/#{@instrument.id}"
	end
	def delete
		@instrument=Instrument.find(params[:id])
		@instrument.delete
		redirect_to"/instruments/"
	end
	
	def find
		@instruments=Instrument.find(:all, 
      :conditions=>["name like ? OR offer_id like ?", "%"+params[:search_string]+"%", "%"+params[:search_string]+"%"])		#非精确匹配
	end
	# #
	  def subscribe
		@instruments=Instrument.find(:name)
		redirect_to"/orders/"
	end
	
	private
	def check_logged_in
		authenticate_or_request_with_http_basic("Instruments") do |username,password|
			username=="admin"&&password=="ww"
		end 
	end	
	
	
end

