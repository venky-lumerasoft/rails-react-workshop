class Api::V1::CardsController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :list, only:[:index, :create, :update]

  def index
    cards = list.cards
    render json: cards, each_serializer: CardSerializer
  end

  def show
    card = Card.find_by_id(params[:id])
    if card
      render json: card
    else
      render json: { error: "Card with id #{params[:id]} Not found" }, status: :not_found
    end
  end

  def create
    card = list.cards.build(card_params)
    if card.save
      render json: card, status: :created
    else
      render json: { error: card.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    card = Card.find(params[:id])
    if card.update(card_params)
      render json: card, status: :ok
    else
      render json: { error: card.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def move
    card = Card.find(params[:id])
    MoveCard.new(card: card, direction: params.fetch(:direction, 'up')).call
    render json: list.cards, each_serializer: CardSerializer
  end

  private

  def dashboard
    @dashboard ||= Dashboard.find(params[:dashboard_id])
  end

  def list
    @list ||= dashboard.lists.find(params[:list_id])
  end

  def card_params
    params.require(:card).permit(:title, :description, :sort_order, :assignee_id, :list_id, :dashboard_id)
  end
end
