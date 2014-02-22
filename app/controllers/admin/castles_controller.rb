class Admin::CastlesController < ApplicationController
  before_filter :authenticate_user!
<<<<<<< HEAD
  before_action :set_castle, only: [:show, :edit, :update, :destroy]

=======
>>>>>>> e1055ad651aab841ba4bd0a57de8ea13256ba552

  def index
  	authorize! :index, @user, :message => 'Not authorized as an administrator.'
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
<<<<<<< HEAD
      if @castle.update(castle_params)
=======
      if @castle.update(params)
>>>>>>> e1055ad651aab841ba4bd0a57de8ea13256ba552
        format.html { redirect_to admin_castle_path(@castle), notice: 'Castle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @castle.errors, status: :unprocessable_entity }
      end
    end
  end

<<<<<<< HEAD
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_castle
      @castle = Castle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def castle_params
      params[:castle]
    end
=======
>>>>>>> e1055ad651aab841ba4bd0a57de8ea13256ba552

end
