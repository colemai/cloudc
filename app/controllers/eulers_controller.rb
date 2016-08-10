class EulersController < ApplicationController
  before_action :set_euler, only: [:show, :edit, :update, :destroy]

require 'csv'

  def import
    @csv_rows = Array.new
    csv_text = File.read(params[:file].path)    
    @csv_rows = CSV.parse(csv_text, :headers => false)
    
    @answers = Array.new
    @csv_rows.each do |row|
      @answers << Euler.filter(row[0].to_i)
      @answers << Euler.filter(row[1].to_i)
    end
        
  end

  def index
    @eulers = Euler.all

  end

  def show
  end

  def new
    @euler = Euler.new
    
  end

  def edit
  end

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
