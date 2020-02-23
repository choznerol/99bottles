# frozen_string_literal: true

# 99 Bottle
class Bottles
  def verse(before)
    after = if before >= 1
              before - 1
            else
              99
            end

    <<~VERSE
      #{n_bottles(before).capitalize} of beer on the wall, #{n_bottles(before)} of beer.
      #{action(before)}, #{n_bottles(after)} of beer on the wall.
    VERSE
  end

  def verses(from, to)
    verses = []
    (to..from).to_a.each do |before|
      verses.unshift verse(before)
    end
    verses.join('
')
  end

  def song
    verses(99, 0)
  end

  private

  def n_bottles(count)
    if count.zero?
      'no more bottles'
    elsif count == 1
      "#{count} bottle"
    else
      "#{count} bottles"
    end
  end

  def action(count)
    if count.zero?
      'Go to the store and buy some more'
    elsif count == 1
      'Take it down and pass it around'
    else
      'Take one down and pass it around'
    end
  end
end
