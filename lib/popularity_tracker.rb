# frozen_string_literal: true

class PopularityTracker
  attr_reader :content_hash
  attr_reader :ordered_popularity

  def initialize
    @content_hash = {}
    @ordered_popularity = []
  end

  def increase_popularity(content_id)
    content = content_hash[content_id]
    unless content
      content = Content.new(content_id)
      content_hash[content_id] ||= content
    end
    content.increase_popularity

    if ordered_popularity.empty?
      ordered_popularity << content
    else
      current_index, next_index  = find_next_index(content)

      if next_index && next_index < current_index
        @ordered_popularity.delete(content)
        if next_index
          @ordered_popularity.insert(next_index, content)
        else
          @ordered_popularity << content
        end
      end
    end
  end

  def most_popular
    ordered_popularity.first.content_id
  end

  private

  def find_next_index(content)
    target_index = nil
    current_index = ordered_popularity.size
    ordered_popularity.each_with_index do |ordered_content, index|
      if content.popularity_score > ordered_content.popularity_score
        target_index ||= index
      end
      if content == ordered_content
        current_index = index
      end
      # Early return if things are already found
      return [current_index, target_index] if current_index && target_index
    end
    [current_index, target_index]
  end
end
