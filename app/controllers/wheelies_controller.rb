class WheeliesController < ApplicationController
  before_action :set_wheely, only: [:show, :edit, :update, :destroy]

  skip_before_action :authenticate_user!, only: :index

  def index
    @wheelies = policy_scope(Wheely).order(created_at: :desc)
    # authorize User
  end

  def show
  end

  def search
    @wheelies = Wheely.where(category_id: params[:category_id])
  end

  def new
    @wheely = Wheely.new
    authorize(@wheely)
  end

  def create
    @wheely = Wheely.new(wheely_params)
    authorize(@wheely)
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
    redirect_to wheelies_path, notice: 'Wheely was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_wheely
    @wheely = Wheely.find(params[:id])
    authorize(@wheely)
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def wheely_params
    params.require(:wheely).permit(:title, :address, :description, :price, :user_id, :category_id)
  end
end
