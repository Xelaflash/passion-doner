class KebabsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_kebab, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      sql_query = 'name ILIKE :query OR address ILIKE :query'
      @kebabs = Kebab.where(sql_query, query: "%#{params[:query]}%")
    else
      @kebabs = Kebab.where.not(latitude: nil, longitude: nil)
    end
    @markers = @kebabs.map do |kebab|
      {
        lat: kebab.latitude,
        lng: kebab.longitude,
        infoWindow: { content: render_to_string(partial: '/kebabs/info_window', locals: { kebab: kebab }) }
      }
    end
  end

  def show
    @review = Review.new
    @reviews = Review.all
    @related_kebabs = @kebab.find_related_bread_category
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
    params.require(:kebab).permit(:name, :address, :description, :photo, bread_category_list: [])
  end

  def set_kebab
    @kebab = Kebab.friendly.find(params[:id])
  end
end
