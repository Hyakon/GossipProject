class PagesController < ApplicationController

  def index
    @gossips = Gossip.all
  end
end
