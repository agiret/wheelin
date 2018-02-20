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
    @wheely.user = current_user

    if @wheely.save
      redirect_to @wheely, notice: 'Wheely was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @wheely.update(wheely_params)
      redirect_to @wheely, notice: 'Wheely was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @wheely.destroy
    redirect_to wheely_path(@wheely), notice: 'Wheely was successfully destroyed.'
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
