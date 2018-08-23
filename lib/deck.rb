class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def bubble_sort(array)
    loop do
      swap = false
      (count - 1).times do |index|
        if array[index].total_card_value > array[index + 1].total_card_value
          array[index], array[index + 1] = array[index + 1], array[index]
          swap = true
        end
      end
      break if not swap
    end
    array
  end


end
