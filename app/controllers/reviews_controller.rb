class ReviewsController < ApplicationController
  def create
    @kebab = Kebab.friendly.find(params[:kebab_id])
    @review = Review.new(review_params)
    @review.kebab = @kebab
    if @review.save
      flash[:success] = 'Review successfully created'
      redirect_to kebab_path(@kebab)
    else
      flash[:alert] = 'Something went wrong'
      render 'kebabs/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to kebab_path(@review.kebab)
  end

  private

  def review_params
    params.require(:review).permit(:content, :bread_rating, :fries_rating, :meat_rating, :sauces_rating, :quantity_rating, :quality_price_ratio, :overall_rating)
  end
end
