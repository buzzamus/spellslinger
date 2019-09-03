class CardsController < ApplicationController

  def index
    @cards = Card.all
  end

  def new; end

  def import
    Card.import(params[:file])
    redirect_to cards_path, notice: 'File added successfully'
  end

end
