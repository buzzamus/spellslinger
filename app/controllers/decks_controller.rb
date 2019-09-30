class DecksController < ApplicationController
  before_action :set_deck, only: [:show]

  def index
    @decks = Deck.all
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(deck_params)
    if @deck.save
      redirect_to decks_path
    else
      render 'new'
    end
  end

  def show; end

  private

  def deck_params
    params.require(:deck).permit(:name, :format)
  end

  def set_deck
    @deck = Deck.find(params[:id])
  end
end
