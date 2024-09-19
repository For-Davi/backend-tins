class CardsController < ApplicationController
  before_action :set_card, only: [ :show, :update, :destroy ]

  def index
    @cards = Card.all
    render json: { cards: @cards }
  end

  def show
    render json: @card
  end

  def create
  @card = Card.new(card_params)

    if @card.save
      @cards = Card.all
      render json: { message: "Cartão criado com sucesso", cards: @cards }, status: :created
    else
      render json: { message: "Erro ao criar cartão", errors: @card.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @card.update(card_params)
      @cards = Card.all
      render json: { message: "Cartão atualizado com sucesso", cards: @cards }, status: :ok
    else
      render json: { message: "Erro ao atualizar cartão", errors: @card.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    if @card.destroy
      @cards = Card.all
      render json: { message: "Cartão deletado com sucesso", cards: @cards }, status: :ok
    else
      render json: { error: "Erro ao deletar o cartão" }, status: :unprocessable_entity
    end
  end

  private

  def set_card
    @card = Card.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Cartão não encontrado" }, status: :not_found
  end

  def card_params
    params.require(:card).permit(:name, :description)
  end
end
