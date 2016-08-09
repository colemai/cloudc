class EulersController < ApplicationController
  before_action :set_euler, only: [:show, :edit, :update, :destroy]


  def import
    @arrr = Array.new
    @arrr << CSV.open((params[:file].read)[0..-3])           
  end

  # GET /eulers
  # GET /eulers.json
  def index
    @eulers = Euler.all

  end

  # GET /eulers/1
  # GET /eulers/1.json
  def show
  end

  # GET /eulers/new
  def new
    @euler = Euler.new
  end

  # GET /eulers/1/edit
  def edit
  end

  # POST /eulers
  # POST /eulers.json
  def create
    @euler = Euler.new(euler_params)

    respond_to do |format|
      if @euler.save
        format.html { redirect_to @euler, notice: 'Euler was successfully created.' }
        format.json { render :show, status: :created, location: @euler }
      else
        format.html { render :new }
        format.json { render json: @euler.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eulers/1
  # PATCH/PUT /eulers/1.json
  def update
    respond_to do |format|
      if @euler.update(euler_params)
        format.html { redirect_to @euler, notice: 'Euler was successfully updated.' }
        format.json { render :show, status: :ok, location: @euler }
      else
        format.html { render :edit }
        format.json { render json: @euler.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eulers/1
  # DELETE /eulers/1.json
  def destroy
    @euler.destroy
    respond_to do |format|
      format.html { redirect_to eulers_url, notice: 'Euler was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_euler
      @euler = Euler.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def euler_params
      params.fetch(:euler, {})
      params.require(:euler).permit(:x,:y, :answer)
    end
end
