class MoveCard

  attr_reader :card, :direction, :index

  DIRECTION = {
    up: 'up',
    down: 'down'
  }

  def initialize(card:, direction: DIRECTION[:up])
    @card = card
    @direction = direction
    @index = cards_in_list.find_index(card)
  end

  def call
    raise 'Unknown Direction' unless DIRECTION.values.include?(direction)
    return if cards_in_list.length <= 1
    return move_up if (direction == DIRECTION[:up])
    move_down
  end

  def cards_in_list
    @cards_in_list ||= card.list.cards
  end

  def move_up
    return if index <= 0
    swap_sort_order(cards_in_list[index - 1])
  end

  def move_down
    return if index >= (cards_in_list.size - 1)
    swap_sort_order(cards_in_list[index + 1])
  end

  def swap_sort_order(other_card)
    ActiveRecord::Base.transaction do
      other_card_sort_order = other_card.sort_order
      other_card.update(sort_order: card.sort_order)
      card.update_attributes(sort_order: other_card_sort_order)
    end
  end
end
