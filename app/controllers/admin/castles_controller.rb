class Admin::CastlesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_castle, only: [:show, :edit, :update, :destroy]

  def index
    @castles = Castle.all.order(:approved, :castle_name_en)
  end

  def show
  	@castle = Castle.find(params[:id])
  end

  def edit
  	@castle = Castle.find(params[:id])
  end

  # PATCH/PUT /castles/1
  # PATCH/PUT /castles/1.json
  def update
    respond_to do |format|
      if @castle.update(castle_params)
        format.html { redirect_to admin_castle_path(@castle), notice: 'Castle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @castle.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_castle
      @castle = Castle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def castle_params
      params.require(:castle).permit!
    end

end
