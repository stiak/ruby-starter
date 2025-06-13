# frozen_string_literal: true

class Content
  attr_reader :content_id
  attr_reader :popularity_score
  def initialize(content_id)
    raise ArgumentError if content_id < 1
    @content_id = content_id
    @popularity_score = 0
  end

  def increase_popularity
    @popularity_score += 1
  end

  def decrease_popularity
    return if @popularity_score == 0
    @popularity_score -= 1
  end
end
