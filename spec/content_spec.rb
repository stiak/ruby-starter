# frozen_string_literal: true

RSpec.describe Content do
  let(:content) { described_class.new(content_id) }
  let(:content_id) { 40 }

  describe ".initialize" do

    context "negative content id" do
      let(:content_id) { -40 }

      it "raises an error" do
        expect{content}.to raise_error(ArgumentError)
      end
    end

    context "zero content id" do
      let(:content_id) { 0 }

      it "raises an error" do
        expect{content}.to raise_error(ArgumentError)
      end
    end
  end

  describe "#increasePopularity" do
    subject(:increase_popularity) { content.increase_popularity }

    it "increase popularity score by 1" do
      expect(content.popularity_score).to eq(0)
      increase_popularity
      expect(content.popularity_score).to eq(1)
    end
  end

  describe "#decreasePopularity" do
    subject(:decrease_popularity) { content.decrease_popularity }

    it "decrease popularity score by 1" do
      content.increase_popularity
      expect(content.popularity_score).to eq(1)
      decrease_popularity
      expect(content.popularity_score).to eq(0)
    end

    context "popularity is zero" do
      it "can't be decremented further than zero" do
        expect(content.popularity_score).to eq(0)
        decrease_popularity
        expect(content.popularity_score).to eq(0)
      end
    end
  end
end
