class LicenseTosController < ApplicationController
  before_action :set_license_to, only: [:show, :edit, :update, :destroy]

  # GET /license_tos
  # GET /license_tos.json
  def index
    @license_tos = LicenseTo.all
  end

  # GET /license_tos/1
  # GET /license_tos/1.json
  def show
  end

  # GET /license_tos/new
  def new
    @license_to = LicenseTo.new
  end

  # GET /license_tos/1/edit
  def edit
  end

  # POST /license_tos
  # POST /license_tos.json
  def create
    for i in @@x
      @z= Own.where(:id => i,:user_id => current_user.id)
    end
    for id in @@x
      for l in @z
        @license_to = LicenseTo.new(license_to_params.merge(:uid => current_user.id,:creation_id => l[:creation_id]))
      end
    end
    @@x.clear()
    respond_to do |format|
      if @license_to.save
        format.html { redirect_to @license_to, notice: 'License to was successfully created.' }
        format.json { render :show, status: :created, location: @license_to }
      else
        format.html { render :new }
        format.json { render json: @license_to.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /license_tos/1
  # PATCH/PUT /license_tos/1.json
  def update
    respond_to do |format|
      if @license_to.update(license_to_params)
        format.html { redirect_to @license_to, notice: 'License to was successfully updated.' }
        format.json { render :show, status: :ok, location: @license_to }
      else
        format.html { render :edit }
        format.json { render json: @license_to.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /license_tos/1
  # DELETE /license_tos/1.json
  def destroy
    @license_to.destroy
    respond_to do |format|
      format.html { redirect_to license_tos_url, notice: 'License to was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add
    if params[:g] && params[:g][:selected]
      @@x = params[:g][:selected]
    end
    if (@@x.nil?)
      redirect_to :back ,notice: "IP asset is not selected"

    elsif (@@x.length() == 1)
          render 'pages/license'
    else
      redirect_to :back ,notice: "Select one at a time"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_license_to
      @license_to = LicenseTo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def license_to_params
      params.require(:license_to).permit(:name, :uid, :licenceagreement)
    end
end
