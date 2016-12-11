class PagesController < ApplicationController  
	def home
		if current_user.adminflag==1 then
			render 'pages/admin'
		else
			if current_user.IPflag==1 then
				render 'pages/committee'
			else
				render 'pages/home'
			end
		end
	end
	def validateIP 
		@creation = Creation.find(params[:id])
		render 'pages/validateIP'
	end

	def validate
		@creation = Creation.find(params[:id])
		@creation.update(ip_flag_params)
		@creation.update(:approver => current_user.id)
		redirect_to :validation
	end

	def validation
		if current_user.IPflag==1 then
			@validations_grid = initialize_grid(Creation.where(:ip_flag => 0).where.not(:creator_id => current_user.id))
			render 'pages/validation'
		end
	end

	def ecom
		if current_user.adminflag==1 then
			@ecoms_grid = initialize_grid(User.where(Occupation: 'faculty', :adminflag => 0), name: 'g')
			render 'pages/editcommittee'
		end
	end

	def modify
		# render plain: params[:g][:selected].inspect
		if current_user.adminflag==1 then
			if params[:first]
				if params[:g] && params[:g][:selected]
					x = params[:g][:selected]
				end
				if (x.blank?)
					redirect_to :back ,notice: "IP Committee members are not selected"
				else  

						for id in x
							@user = User.find(id)
							@user.IPflag =1
							@user.save
						end
						redirect_to :back ,notice: "IP Committee members are selected"
						#render 'pages/ecom'
				end
				#redirect_to :back
			elsif params[:second]
				#render plain: params[:g][:selected].inspect
				if params[:g] && params[:g][:selected]
					x = params[:g][:selected]
				end
				if (x.blank?)
					redirect_to :back ,notice: "IP Committee members are not selected"
				else 
					j=User.where(:IPflag => 1).count(:all)
					if j < 4
						redirect_to :back ,notice: "Atleast 3 members should be select"
					else
						for id in x
							@user = User.find(id)
							@user.IPflag =0
							@user.save
						end
						redirect_to :back ,notice: "IP Committee members are selected"
						#render 'pages/ecom'
					end
				end
				#redirect_to :back
			end
		end
	end

	def admin
		if current_user.adminflag==1 then
			render 'pages/admin'
		end
	end

	def committee
		if current_user.IPflag==1 then
			render 'pages/committee'
		end
	end

	def inprocess
		@ownedips_grid = initialize_grid(Creation.where(creator_id: current_user.id, :ip_flag => 0))
		render 'pages/inprocess'
	end
	
	def owned
		@ownedips_grid = initialize_grid(Own.where(user_id: current_user.id), name: 'g')
		render 'pages/owned'
	end
	
	def search
		param = params[:q]
		creation = Creation.where(:id => params)
	end

	def al
		@creations_grid = initialize_grid(Creation.where(:ip_flag => 1), name:'g')
		render 'pages/admin_search'
	end
	
	def FIP
		render 'pages/filing_creation'
	end

	def addlicense
		render 'pages/license'
	end

	def addown
		render 'pages/addowner'
	end

	def pubip
		@pubips_grid = initialize_grid(Creation.all)
		render 'pages/public'
	end

	def vlic
		@a=Own.where(:user_id => current_user.id).select("creation_id")
		@lic_grid = initialize_grid(LicenseTo.where('creation_id IN (?)',@a))
		render 'pages/viewlicense'
	end

	private
		def ip_flag_params
			params.require(:creation).permit([:ip_flag, :ip_policy])
		end
end