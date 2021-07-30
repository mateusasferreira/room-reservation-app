class ReservasController < ApplicationController
  before_action :set_reserva, only: %i[ show edit update destroy ]
  before_action :is_authorized?, only: [:destroy, :edit, :update]
  before_action :authenticate_user!
  # GET /reservas or /reservas.json
  def index
    @reservas = Reserva.all
  end

  # GET /reservas/1 or /reservas/1.json
  def show
  end

  # GET /reservas/new
  def new
    @reserva = Reserva.new 
  end

  # GET /reservas/1/edit
  def edit
  end

  # POST /reservas or /reservas.json
  def create
    @reserva = Reserva.new(reserva_params)
    respond_to do |format|
      if @reserva.save
        format.html { redirect_to @reserva, notice: "Reserva criada com sucesso" }
        format.json { render :show, status: :created, location: @reserva }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservas/1 or /reservas/1.json
  def update
    respond_to do |format|
      if @reserva.update(reserva_params)
        format.html { redirect_to @reserva, notice: "Reserva atualizada com sucesso" }
        format.json { render :show, status: :ok, location: @reserva }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservas/1 or /reservas/1.json
  def destroy
    @reserva.destroy
    respond_to do |format|
      format.html { redirect_to reservas_url, notice: "Reserva excluída com sucesso" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserva
      @reserva = Reserva.find(params[:id])
    end
    
    # Autoriza somente o dono da reserva a editá-la ou excluí-la
    def is_authorized?
      @reserva = Reserva.find(params[:id])
      if(@reserva.user_id != current_user.id)
        redirect_to @reserva, notice: "somente a pessoa que reservou este horário pode executar essa ação"
      end
    end

    # Only allow a list of trusted parameters through.
    def reserva_params
      params.require(:reserva).permit(:user_id, :solicitante, :data, :descricao)
    end
end
