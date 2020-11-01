class GossipsController < ApplicationController
  def show
    @gossip = Gossip.find(params[:id])
    @review = Review.new
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(gossip_params)
    @gossip.user_id = 1
    if @gossip.save
      flash.notice = "Gossip Created"
      redirect_to @gossip
    else
      @gossip.errors.full_messages.each do |message|
        flash.alert = "Error #{message}"
      end
      render :new
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip.update(gossip_params)
    if @gossip.save
      flash.notice = "Gossip Updated"
      redirect_to @gossip
    else
      @gossip.errors.full_messages.each do |message|
        flash.alert = "Error #{message}"
      end
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.delete
    flash.notice = "Gossip Destroyed"

    redirect_to root_path
  end


  private

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end
end
