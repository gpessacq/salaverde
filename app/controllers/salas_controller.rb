class SalasController < ApplicationController
#  http_basic_authenticate_with name: "invitado", password: "password2014"
  before_action :set_sala, only: [:show, :edit, :update, :destroy]

  # GET /salas
  # GET /salas.json
  def index
    @salas = Sala.paginate(page: params[:page]).per_page(8).order(:fecha_festejo)
  end

  # GET /salas/1
  # GET /salas/1.json
  def show
    
   if params[:lugar_festejo].present?
      @sala.latitude = '-34.603229' 
      @sala.longitude = '-58.381842'
    end    
    
  end

  # GET /salas/new
  def new
    @sala = Sala.new
  end

  # GET /salas/1/edit
  def edit
  end

  # POST /salas
  # POST /salas.json
  def create
    @sala = Sala.new(sala_params)
    
    unless params[:lugar_festejo].present?
      @sala.latitude = '-34.603229' 
      @sala.longitude = '-58.381842'
    end
    
    respond_to do |format|
      if @sala.save
        format.html { redirect_to @sala, notice: 'Regitro agregado.' }
        format.json { render action: 'show', status: :created, location: @sala }
      else
        format.html { render action: 'new' }
        format.json { render json: @sala.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salas/1
  # PATCH/PUT /salas/1.json
  def update
    
    unless params[:lugar_festejo].present?
      @sala.latitude = '-34.603229' 
      @sala.longitude = '-58.381842'
    end
    
    respond_to do |format|
      if @sala.update(sala_params)
        format.html { redirect_to @sala, notice: 'Registro modificado.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sala.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salas/1
  # DELETE /salas/1.json
  def destroy
    @sala.destroy
    respond_to do |format|
      format.html { redirect_to salas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sala
      @sala = Sala.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sala_params
      params.require(:sala).permit(:nombre, :apellido, :cumple, :email, :fecha_festejo, :lugar_festejo, :latitude, :longitude)
    end
end
