class Admin::CastlesController < ApplicationController
  before_filter :authenticate_user!

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
      if @castle.update(params)
        format.html { redirect_to admin_castle_path(@castle), notice: 'Castle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @castle.errors, status: :unprocessable_entity }
      end
    end
  end


end
