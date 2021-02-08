class KebabsController < ApplicationController
  # skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_kebab, only: %i[show edit update destroy]

  def index
    @kebabs = Kebab.all
  end

  def show
    @review = Review.new
    @reviews = Review.all
  end

  def new
    @kebab = Kebab.new
  end

  def create
    @kebab = Kebab.new(kebab_params)
    if @kebab.save
      flash[:notice] = 'Kebab successfully created'
      redirect_to kebab_path(@kebab)
    else
      flash.now[:alert] = 'Problem when creating Kebab'
      render :new
    end
  end

  def edit; end

  def update
    if @kebab.update(kebab_params)
      flash[:notice] = 'Kebab updated'
      redirect_to kebab_path(@kebab)
    else
      flash.now[:alert] = 'Problem when updating Kebab'
      render :update
    end

  end

  def destroy
    @kebab.destroy
    redirect_to kebabs_path
  end

  private

  def kebab_params
    params.require(:kebab).permit(:name, :address)
  end

  def set_kebab
    @kebab = Kebab.friendly.find(params[:id])
  end
end
