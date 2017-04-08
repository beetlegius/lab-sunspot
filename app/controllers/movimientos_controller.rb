class MovimientosController < ApplicationController
  before_action :set_movement, only: [:show, :edit, :update, :destroy]

  # GET /movimientos
  # GET /movimientos.json
  def index
    busqueda = params[:q]
    if busqueda
      @search = Movimiento.search do
        fulltext busqueda[:name]

        with(:ammount).less_than busqueda[:ammount] if busqueda[:ammount].present?
        order_by :ammount, :desc
        paginate page: params[:page], per_page: 20
      end
      @movimientos = @search.results
    else
      @movimientos = Movimiento.page(params[:page]).per(20)
    end
  end

  # GET /movimientos/1
  # GET /movimientos/1.json
  def show
  end

  # GET /movimientos/new
  def new
    @movimiento = Movimiento.new
  end

  # GET /movimientos/1/edit
  def edit
  end

  # POST /movimientos
  # POST /movimientos.json
  def create
    @movimiento = Movimiento.new(movement_params)

    respond_to do |format|
      if @movimiento.save
        format.html { redirect_to @movimiento, notice: 'Movimiento was successfully created.' }
        format.json { render :show, status: :created, location: @movimiento }
      else
        format.html { render :new }
        format.json { render json: @movimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movimientos/1
  # PATCH/PUT /movimientos/1.json
  def update
    respond_to do |format|
      if @movimiento.update(movement_params)
        format.html { redirect_to @movimiento, notice: 'Movimiento was successfully updated.' }
        format.json { render :show, status: :ok, location: @movimiento }
      else
        format.html { render :edit }
        format.json { render json: @movimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movimientos/1
  # DELETE /movimientos/1.json
  def destroy
    @movimiento.destroy
    respond_to do |format|
      format.html { redirect_to movements_url, notice: 'Movimiento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movement
      @movimiento = Movimiento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movement_params
      params.require(:movimiento).permit(:name, :ammount, :cliente_id)
    end
end
