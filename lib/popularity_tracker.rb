# frozen_string_literal: true

class PopularityTracker
  attr_reader :content_hash
  attr_reader :content_head

  def initialize
    @content_hash = {}
  end

  def increase_popularity(content_id)
    content = content_hash[content_id]
    unless content
      content = Content.new(content_id)
      # Store it by ID
      content_hash[content_id] ||= content
      # Add it to the content list

      if content_head.empty?
        @content_head = content
      else
        content_head.add(content)
      end
    end

    content.increase_popularity


  end

  def most_popular
    ordered_popularity.first.content_id
  end
end
