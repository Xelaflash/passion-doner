class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new
    @kebab = Kebab.friendly.find(params[:kebab_id])
    @review = Review.new
  end

  def create
    @reviews = Review.all
    @kebab = Kebab.friendly.find(params[:kebab_id])
    @related_kebabs = @kebab.find_related_bread_category
    @review = Review.new(review_params)
    @review.kebab = @kebab
    if @review.save
      respond_to do |format|
        format.html { redirect_to kebab_path(@kebab, anchor: "review-#{@review.id}") }
        format.js
      end
      flash[:notice] = 'Votre commentaire a été ajouté'
    else
      respond_to do |format|
        format.html { render 'kebabs/show'}
        format.js
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to kebab_path(@review.kebab)
  end

  private

  def review_params
    params.require(:review).permit(:author, :content, :bread_rating, :fries_rating, :meat_rating, :sauces_rating, :quantity_rating, :quality_price_ratio, :overall_rating)
  end
end
