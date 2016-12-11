class OwnsController < ApplicationController
	before_action :set_own, only: [:show, :edit, :update, :destroy]

	# GET /owns
	# GET /owns.json
	def index
		@owns = Own.all
	end

	# GET /owns/1
	# GET /owns/1.json
	def show
	end

	# GET /owns/new
	def new
		@own = Own.new
	end

	# GET /owns/1/edit
	def edit
	end

	# POST /owns
	# POST /owns.json
	def create
		@y=User.where(:email => own_params[:email])
		for i in @@x
			@z=Own.select('sum(precentage) as precentage').where('creation_id = ?',i);
		end
		if @z.empty?
			w=0;
		else
			w=@z[0][:precentage];
		end
		l=own_params[:precentage].to_i;
		c=w+l;
		if c > 100
			c=100-w;
			redirect_to addowner_path, notice: "Percentage cannot be greater than 100 you can add maximum #{c} percentage"
		elsif @y.blank?
			redirect_to addowner_path, notice: 'Invalid Email Id Entered'
		else
			for i in @@x
				for l in @y
					@own = Own.new(own_params.merge(:creation_id => i,:user_id => l[:id]))
				end
			end
			@@x.clear()
			respond_to do |format|
				if @own.save
					format.html { redirect_to @own, notice: 'Own was successfully created.' }
					format.json { render :show, status: :created, location: @own }
				else
					format.html { render :new }
					format.json { render json: @own.errors, status: :unprocessable_entity }
				end
			end
		end
	end

	# PATCH/PUT /owns/1
	# PATCH/PUT /owns/1.json
	def update
		respond_to do |format|
			if @own.update(own_params)
				format.html { redirect_to @own, notice: 'Own was successfully updated.' }
				format.json { render :show, status: :ok, location: @own }
			else
				format.html { render :edit }
				format.json { render json: @own.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /owns/1
	# DELETE /owns/1.json
	def destroy
		@own.destroy
		respond_to do |format|
			format.html { redirect_to owns_url, notice: 'Own was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	def money
		if params[:g] && params[:g][:selected]
     		@@x = params[:g][:selected]
    	end
    	if (@@x.nil?)
     		redirect_to :back ,notice: "IP asset is not selected"

    	elsif (@@x.length() == 1)
          render 'pages/addowner'
    	else
      		redirect_to :back ,notice: "Select one at a time"
    	end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_own
			@own = Own.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def own_params
			params.require(:own).permit(:precentage, :email)
		end
end
