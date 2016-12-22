class PfeaturesController < ApplicationController
  before_action :set_pfeature, only: [:show, :edit, :update, :destroy]

  # GET /pfeatures
  # GET /pfeatures.json
  def index
    @pfeatures = Pfeature.all
  end

  # GET /pfeatures/1
  # GET /pfeatures/1.json
  def show
  end

  # GET /pfeatures/new
  def new
    @pfeature = Pfeature.new
  end

  # GET /pfeatures/1/edit
  def edit
  end

  # POST /pfeatures
  # POST /pfeatures.json
  def create
    @pfeature = Pfeature.new(pfeature_params)

    respond_to do |format|
      if @pfeature.save
        format.html { redirect_to @pfeature, notice: 'Pfeature was successfully created.' }
        format.json { render :show, status: :created, location: @pfeature }
      else
        format.html { render :new }
        format.json { render json: @pfeature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pfeatures/1
  # PATCH/PUT /pfeatures/1.json
  def update
    respond_to do |format|
      if @pfeature.update(pfeature_params)
        format.html { redirect_to @pfeature, notice: 'Pfeature was successfully updated.' }
        format.json { render :show, status: :ok, location: @pfeature }
      else
        format.html { render :edit }
        format.json { render json: @pfeature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pfeatures/1
  # DELETE /pfeatures/1.json
  def destroy
    @pfeature.destroy
    respond_to do |format|
      format.html { redirect_to pfeatures_url, notice: 'Pfeature was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pfeature
      @pfeature = Pfeature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pfeature_params
      params.require(:pfeature).permit(:name, :fdate, :active_status, :sort)
    end
end
