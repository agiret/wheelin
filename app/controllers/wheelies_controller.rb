class WheeliesController < ApplicationController
  before_action :set_wheely, only: [:show, :edit, :update, :destroy]
  def index
    @wheelies = Wheely.all
  end

  def show
  end

  def search
    @wheelies = Wheely.where(category_id: params[:category_id])
  end

  def new
    @wheely = Wheely.new
  end

  def create
    @wheely = Wheely.new(wheely_params)
    respond_to do |format|
      if @wheely.save
        format.html { redirect_to @wheely, notice: 'Wheely was successfully created.' }
        format.json { render :show, status: :created, location: @wheely }
      else
        format.html { render :new }
        format.json { render json: @wheely.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @wheely.update(wheely_params)
        format.html { redirect_to @wheely, notice: 'Wheely was successfully updated.' }
        format.json { render :show, status: :ok, location: @wheely }
      else
        format.html { render :edit }
        format.json { render json: @wheely.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @wheely.destroy
    respond_to do |format|
      format.html { redirect_to wheely_path(@wheely), notice: 'Wheely was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_wheely
    @wheely = Wheely.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def wheely_params
    params.require(:wheely).permit(:title, :address, :description, :price, :user_id, :category_id)
  end
end
