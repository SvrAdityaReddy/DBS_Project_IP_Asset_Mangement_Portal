class CreationsController < ApplicationController
  before_action :set_creation, only: [:show, :edit, :update, :destroy]

  # GET /creations
  # GET /creations.json
  def index
    @creations = Creation.all
  end

  # GET /creations/1
  # GET /creations/1.json
  def show
  end

  # GET /creations/new
  def new
    @creation = Creation.new
  end

  # GET /creations/1/edit
  def edit
  end

  # POST /creations
  # POST /creations.json
  def create
    @z=Creation.where(:title => creation_params[:title])
    if @z.blank?
      if current_user.adminflag==1 then
         @creation = Creation.new(creation_params)
      else 
        @creation = Creation.new(creation_params.merge(:creator_id => current_user.id))
      end
      #@creation = Creation.new(creation_params.merge(:creator_id => current_user.id))

      respond_to do |format|
        if @creation.save
          format.html { redirect_to @creation, notice: 'Creation was successfully created.' }
          format.json { render :show, status: :created, location: @creation }
        else
          format.html { redirect_to :back, notice: 'File Type Not supported' }
          format.json { render json: @creation.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to fileIP_path, notice: 'Title already exists'
    end 
  end

  # PATCH/PUT /creations/1
  # PATCH/PUT /creations/1.json
  def update
    respond_to do |format|
      if @creation.update(creation_params)
        if current_user.adminflag==1 then
          format.html { redirect_to @creation, notice: 'IP Asset was successfully updated.' }
        else 
          format.html { redirect_to @creation, notice: 'Creation was successfully updated.' }
        end
        format.json { render :show, status: :ok, location: @creation }
      else
        format.html { render :edit }
        format.json { render json: @creation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creations/1
  # DELETE /creations/1.json
  def destroy
    @creation.destroy
    respond_to do |format|
      format.html { redirect_to creations_url, notice: 'Creation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creation
      @creation = Creation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def creation_params
      if current_user.adminflag==1 then
        params.require(:creation).permit(:creation_id, :title, :tp, :avatar, :creator_id, :royalty, :liabilities, :ip_policy, :ip_flag)
      else 
        params.require(:creation).permit(:title, :tp, :avatar,:creator_id)
      end
      #params.require(:creation).permit(:creation_id, :title, :tp, :proposal, :creator_id, :royalty, :liabilities, :ip_policy, :ip_flag)
      #params.require(:creation).permit(:title, :tp, :proposal,:creator_id)
    end
end
