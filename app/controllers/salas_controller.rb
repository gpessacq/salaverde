class SalasController < ApplicationController
#  http_basic_authenticate_with name: "invitado", password: "password2014"
  before_action :set_sala, only: [:show, :edit, :update, :destroy]

  def index
    @salas = Sala.paginate(page: params[:page]).per_page(8).order(:fecha_festejo)
  end

  def show
    @hash = Gmaps4rails.build_markers(@sala) do |user, marker|
      marker.lat @sala.latitude
      marker.lng @sala.longitude
    end
  end

  def new
    @sala = Sala.new
  end

  def edit
  end

  def create
    @sala = Sala.new(sala_params)
    set_default_location
    respond_to do |format|
      if @sala.save
        format.html { redirect_to @sala, notice: 'Registro agregado.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    set_default_location
    respond_to do |format|
      if @sala.update(sala_params)
        format.html { redirect_to @sala, notice: 'Registro modificado.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @sala.destroy
    respond_to do |format|
      format.html { redirect_to salas_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sala
      @sala = Sala.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sala_params
      params.fetch(:sala, {}).permit(:nombre, :apellido, :cumple, :email,
                                   :fecha_festejo, :lugar_festejo)
    end

    def set_default_location
      unless params[:lugar_festejo].present?
        @sala.latitude = '-34.603229'
        @sala.longitude = '-58.381842'
      end
    end
end
