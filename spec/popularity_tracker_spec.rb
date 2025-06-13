# frozen_string_literal: true

RSpec.describe PopularityTracker do
  let(:content_id) { 7 }
  let(:tracker) { described_class.new }

  describe "#increasePopularity" do
    subject(:increase_popularity) { tracker.increase_popularity(content_id) }

    it "increases the popularity of content with given id" do
      increase_popularity

      expect(tracker.content_hash.size).to eq(1)
      first_content = tracker.content_hash[content_id]
      expect(first_content).not_to be_nil
      expect(first_content.content_id).to eq(7)
      expect(first_content.popularity_score).to eq(1)
    end
  end


  describe "#mostPopular" do
    let(:content_7) { 7 }
    let(:content_8) { 8 }

    it "returns the content ID with highest popularity" do
      tracker.increase_popularity(content_7)
      tracker.increase_popularity(content_7)
      tracker.increase_popularity(content_8)
      expect(tracker.most_popular).to eq(content_7)

      tracker.increase_popularity(content_8)
      tracker.increase_popularity(content_8)

      expect(tracker.most_popular).to eq(content_8)

      tracker.increase_popularity(content_7)
      tracker.increase_popularity(content_7)

      expect(tracker.most_popular).to eq(content_7)

      tracker.increase_popularity(5)
      tracker.increase_popularity(5)
      tracker.increase_popularity(5)
      tracker.increase_popularity(5)
      tracker.increase_popularity(5)

      expect(tracker.most_popular).to eq(5)
    end

  end
end
