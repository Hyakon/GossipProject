class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @gossip = Gossip.find(params[:gossip_id])
    # @review = Review.new(review_params)
    @review = @gossip.reviews.build(review_params)
    @review.user_id = 11
    if @review.save
      flash.notice = 'comment added'
      redirect_to @gossip
    else
      flash.notice = 'error'
      render :new
    end
  end

  def edit
    @gossip = Gossip.find(params[:gossip_id])
    @review = Review.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:gossip_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash.notice = 'comment changed'
      redirect_to @gossip
    else
      flash.notice = 'error'
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @review = @gossip.reviews.find(params[:id]).delete
    redirect_to @gossip
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
